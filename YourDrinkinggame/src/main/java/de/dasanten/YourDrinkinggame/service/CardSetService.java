package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.CardSetCategoryEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.mapper.CardSetMapper;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.repository.CardSetCategoryRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CardSetService {

    private final CardSetRepository cardSetRepository;
    private final CardSetCategoryRepository categoryRepository;

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

    @Transactional
    public CardSetDto addCardSet(CardSetDto cardSetDto) {
        if(cardSetDto.getId()!= null) {
            throw new IllegalArgumentException("Can't add with id");
        }
        validation(cardSetDto);
        //TODO Logik für Owner setzen
        CardSetEntity mappedCardSet = cardSetMapper.toEntity(cardSetDto);
        CardSetCategoryEntity category = getCategoryFromDataBase(cardSetDto.getCategory());
        mappedCardSet.setCategory(category);
        CardSetEntity savedCardSet = cardSetRepository.save(mappedCardSet);
        savedCardSet.getCards().forEach(cardEntity -> {
            cardEntity.setCardSet(savedCardSet);
            if (cardEntity.getRelativeCard()!=null) {
                cardEntity.getRelativeCard().setCardSet(savedCardSet);
            }
        });
        return  cardSetMapper.toDto(savedCardSet);
    }


    public CardSetDto editCardSet(CardSetDto cardSetDto) {
        //TODO Berechtigungs check einbauen
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

    private boolean isOwner() {
        return true;
    }
}
