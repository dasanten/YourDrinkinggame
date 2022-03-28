package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.CardSetCategoryEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.entity.keys.CardSetRoleKey;
import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import de.dasanten.YourDrinkinggame.mapper.CardSetMapper;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.repository.CardSetCategoryRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRoleRepository;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.MethodNotAllowedException;

import java.util.*;
import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class CardSetService {

    private final CardSetRepository cardSetRepository;
    private final CardSetCategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final CardSetRoleRepository cardSetRoleRepository;

    private final CardSetMapper cardSetMapper;

    public CardSetDto getCardSetById(String cardSetId) {
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetId);
        if (cardSetEntityOptional.isPresent()) {
            CardSetEntity cardSet =  cardSetEntityOptional.get();
            return cardSetMapper.toDto(cardSet);
        }
        throw new IllegalArgumentException("No CardSet with this id found!");
    }

    public List<CardSetBasicDto> getTopCardSets(int start) {
        List<CardSetEntity> cardSetEntityList = cardSetRepository.getTopCardSets(start);
        List<CardSetBasicDto> cardSetDtoList = new ArrayList<>();
        cardSetEntityList.forEach(cardSet -> cardSetDtoList.add(cardSetMapper.toBasicDto(cardSet)));
        return cardSetDtoList;
    }

    public List<CardSetBasicDto> searchCardSets(int start, String query) {
        List<CardSetEntity> cardSetEntityList = cardSetRepository.search(start, query);
        List<CardSetBasicDto> cardSetDtoList = new ArrayList<>();
        cardSetEntityList.forEach(cardSet -> cardSetDtoList.add(cardSetMapper.toBasicDto(cardSet)));
        return cardSetDtoList;
    }

    @Transactional
    public CardSetDto addCardSet(CardSetDto cardSetDto) {
        if(cardSetDto.getId()!= null) {
            throw new IllegalArgumentException("Can't add with id");
        }
        validation(cardSetDto);
        CardSetEntity mappedCardSet = cardSetMapper.toEntity(cardSetDto);
        CardSetCategoryEntity category = getCategoryFromDataBase(cardSetDto.getCategory());
        mappedCardSet.setCategory(category);
        mappedCardSet.setCardSetRoles(new ArrayList<>());
        mappedCardSet.getCardSetRoles().add(createOwner(mappedCardSet));
        CardSetEntity savedCardSet = cardSetRepository.save(mappedCardSet);
        savedCardSet.getCards().forEach(cardEntity -> {
            cardEntity.setCardSet(savedCardSet);
            if (cardEntity.getRelativeCard()!=null) {
                cardEntity.getRelativeCard().setCardSet(savedCardSet);
            }
        });
        return  cardSetMapper.toDto(savedCardSet);
    }

    private CardSetRoleEntity createOwner(CardSetEntity cardSet) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity user = userEntityOptional.get();
        CardSetRoleEntity cardSetRoleEntity = new CardSetRoleEntity();
        cardSetRoleEntity.setRole(CardSetRole.OWNER);
        cardSetRoleEntity.setUser(user);
        cardSetRoleEntity.setCardSet(cardSet);
        CardSetRoleKey cardSetRoleKey = new CardSetRoleKey();
        cardSetRoleKey.setCardSetId(cardSet.getId());
        cardSetRoleKey.setUserId(user.getId());
        cardSetRoleEntity.setId(cardSetRoleKey);
        return cardSetRoleEntity;
    }

    public CardSetDto editCardSet(CardSetDto cardSetDto) {
        if(cardSetDto.getId().isEmpty()) {
            throw new IllegalArgumentException("Can't edit without id");
        }
        validation(cardSetDto);
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDto.getId());
        if (cardSetEntityOptional.isEmpty()){
            throw new NoSuchElementException("No CardSet with given id");
        }
        CardSetEntity dbCardSet = cardSetEntityOptional.get();
        CardSetEntity mappedCardSet = cardSetMapper.toEntity(cardSetDto);
        if (!hasRole(dbCardSet.getCardSetRoles())) {
            throw new MissingPermissionException("No permissions for cardset");
        }
        if (!(mappedCardSet.getName().equals(dbCardSet.getName())
                &&  mappedCardSet.getDescription().equals(dbCardSet.getDescription())
                && mappedCardSet.isNsfw()!=dbCardSet.isNsfw())) {
            if (!checkForRole(dbCardSet.getCardSetRoles(), CardSetRole.OWNER, CardSetRole.ADMIN)) {
                throw new MissingPermissionException("Just Admins or Owner can change Description");
            }
        }

        mappedCardSet.setVersion(dbCardSet.getVersion()+1);
        mappedCardSet.getCards().forEach(cardEntity -> {
            cardEntity.setCardSet(mappedCardSet);
            if (cardEntity.getRelativeCard()!=null) {
                cardEntity.getRelativeCard().setCardSet(mappedCardSet);
            }
        });
        CardSetEntity editedCardSet = cardSetRepository.save(mappedCardSet);
        return cardSetMapper.toDto(editedCardSet);
    }

    private CardSetCategoryEntity getCategoryFromDataBase(String categoryName) {
        Optional<CardSetCategoryEntity> category = categoryRepository.findByName(categoryName);
        return category.orElse(null);
    }

    private void validation(CardSetDto cardSetDto) {
        if (cardSetDto.getName().isEmpty()) {
            throw new IllegalArgumentException("Name value is needed!");
        }
        if (cardSetDto.getCards()==null || cardSetDto.getCards().size()<=0) {
            throw new IllegalArgumentException("Cards needed for CardSet");
        }
        if(cardSetDto.getCards().stream().anyMatch(cardDto -> cardDto.getContent()==null || cardDto.getContent().isEmpty())) {
            throw new IllegalArgumentException("Card Content is needed!");
        }
    }

    private boolean checkForRole(List<CardSetRoleEntity> cardSetRoles, CardSetRole ...role) {
        return cardSetRoles.stream()
            .anyMatch(cardSetRoleEntity ->
                (cardSetRoleEntity.getUser().getId().equals(SecurityUtil.getAuthId())
                && Arrays.stream(role).anyMatch(role1 -> role1.equals(cardSetRoleEntity.getRole()))));
    }

    private boolean hasRole(List<CardSetRoleEntity> cardSetRoles) {
        return cardSetRoles.stream()
            .anyMatch(cardSetRoleEntity -> cardSetRoleEntity.getUser().getId().equals(SecurityUtil.getAuthId()));
    }


}
