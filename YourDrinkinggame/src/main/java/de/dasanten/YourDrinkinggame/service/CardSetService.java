package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.CardEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetCategoryEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.mapper.CardSetMapper;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.repository.CardRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetCategoryRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CardSetService {

    private final CardSetRepository cardSetRepository;
    private final CardRepository cardRepository;
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
        List<CardEntity> savedCards = saveCards(savedCardSet);
        savedCardSet.setCards(savedCards);
        return  cardSetMapper.toDto(savedCardSet);
    }


    public CardSetDto editCardSet(CardSetDto cardSetDto) {
        //TODO Berechtigungs check einbauen
        if(cardSetDto.getId().isEmpty()) {
            throw new IllegalArgumentException("Can't edit without id");
        }
        validation(cardSetDto);
        CardSetEntity dbCardSet = cardSetRepository.getById(cardSetDto.getId());
        CardSetEntity mappedCardSet = cardSetMapper.toEntity(cardSetDto);
        mappedCardSet.setVersion(dbCardSet.getVersion()+1);
        mappedCardSet.setCards(editCards(dbCardSet, mappedCardSet));
        CardSetEntity editedCardSet = cardSetRepository.save(mappedCardSet);
        return cardSetMapper.toDto(editedCardSet);
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

    private List<CardEntity> saveCards(CardSetEntity savedCardSet) {
        List<CardEntity> cardEntityList = savedCardSet.getCards();
        cardEntityList.forEach(cardEntity ->
            cardEntity.setCardSet(savedCardSet)
        );
        return cardRepository.saveAll(cardEntityList);
    }

    private List<CardEntity> editCards(CardSetEntity dbCardSet, CardSetEntity mappedCardSet) {
        //find removed sets
        List<CardEntity> finalCards = new ArrayList<>();
        List<CardEntity> removeList = new ArrayList<>();
        for (CardEntity dtoCard: mappedCardSet.getCards()) {
            Optional<CardEntity> card = dbCardSet.getCards()
                    .stream()
                    .filter(cardEntity -> cardEntity.getId().equals(dtoCard.getId()))
                    .findAny();
            if (card.isPresent()) {
                finalCards.add(card.get());
                CardEntity dbCardEntity = card.get();
                dbCardEntity.setContent(dtoCard.getContent());
                dbCardEntity.setType(dtoCard.getType());
                if (dtoCard.getRelativeCard() != null) {
                    if(dbCardEntity.getRelativeCard()==null) {
                        dbCardEntity.setRelativeCard(new CardEntity());
                    }
                    dbCardEntity.getRelativeCard().setContent(dtoCard.getRelativeCard().getContent());
                    dbCardEntity.getRelativeCard().setType(dtoCard.getRelativeCard().getType());
                } else {
                    if(dbCardEntity.getRelativeCard()!=null) {
                        removeList.add(dbCardEntity.getRelativeCard());
                    }
                    dbCardEntity.setRelativeCard(null);
                }
            } else {
                dtoCard.setCardSet(dbCardSet);
                finalCards.add(dtoCard);
            }
        }
        dbCardSet.getCards().forEach(cardEntity -> {
            if(finalCards.stream().noneMatch(cardEntity1 -> Objects.equals(cardEntity1.getId(), cardEntity.getId()))) {
                removeList.add(cardEntity);
            }
        });
        cardRepository.deleteAll(removeList);
        List<CardEntity> savedCards =  cardRepository.saveAll(finalCards);
        for (CardEntity card: savedCards) {
            if(card.getRelativeCard()!=null) {
                card.setRelativeCard(cardRepository.save(card.getRelativeCard()));
            }
        }
        return savedCards;
    }

    private CardSetCategoryEntity getCategoryFromDataBase(String categoryName) {
        Optional<CardSetCategoryEntity> category = categoryRepository.findByName(categoryName);
        return category.orElse(null);
    }
}
