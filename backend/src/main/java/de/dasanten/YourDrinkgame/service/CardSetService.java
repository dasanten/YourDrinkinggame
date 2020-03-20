package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import de.dasanten.YourDrinkgame.util.CardMapper;
import de.dasanten.YourDrinkgame.util.CardSetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;
    @Autowired
    CardRepository cardRepository;
    @Autowired
    CardSetMapper cardSetMapper;
    @Autowired
    CardMapper cardMapper;





    //GETTER
    public List<CardDTO> getCardSetCardsById(String id) {
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        List<CardDTO> cardDTOList = new ArrayList<>();
        if (cardSetEntityOptional.isPresent()) {
            List<CardEntity> cardEntityList = cardRepository.findByCardSetEntity(cardSetEntityOptional.get());
            for (CardEntity cardEntity : cardEntityList) {
                cardDTOList.add(cardMapper.cardEntityToCardDTO(cardEntity));
            }
            return cardDTOList;
        }
        return null;
    }

    public CardSetDTO getCardSetById(String id){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        if (cardSetEntityOptional.isPresent()){
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntityOptional.get());
        }
        return null;
    }

    public CardDTO getCardById(String id){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(id);
        if (cardEntityOptional.isPresent()){
            return cardMapper.cardEntityToCardDTO(cardEntityOptional.get());
        }
        return null;
    }

    public CardSetDTO getCardSetByCardId(String id){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(id);
        if (cardEntityOptional.isPresent()){
            Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardEntityOptional.get().getId());
            if (cardSetEntityOptional.isPresent()){
                return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntityOptional.get());
            }
        }
        return null;
    }


    //SETTER
    public CardSetDTO addCardSet(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = cardSetRepository.save(cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO));
        return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
    }

    public List<CardDTO> addCards(List<CardDTO> cardDTOS){
        List<CardEntity> cardEntityList = new ArrayList<>();
        for (CardDTO cardDTO: cardDTOS){
            cardEntityList.add(cardMapper.cardDTOToCardEntity(cardDTO));
        }
        cardRepository.saveAll(cardEntityList);
        return cardDTOS;
    }


    //EDIT
    public CardSetDTO editCardSet(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = cardSetRepository.save(cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO));
        return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
    }

    public CardDTO editCard(CardDTO cardDTO){
        CardEntity cardEntity = cardRepository.save(cardMapper.cardDTOToCardEntity(cardDTO));
        return cardMapper.cardEntityToCardDTO(cardEntity);
    }


    //DELETE
    public CardSetDTO deleteCardSet(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO);
        cardSetRepository.delete(cardSetEntity);
        cardRepository.deleteByCardSetEntity(cardSetEntity);
        return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
    }

    public CardDTO deleteCard(CardDTO cardDTO){
        CardEntity cardEntity = cardMapper.cardDTOToCardEntity(cardDTO);
        cardRepository.delete(cardEntity);
        return cardMapper.cardEntityToCardDTO(cardEntity);
    }



    //REPORTS
    public void reportCardSet(String cardSetId){
        Optional <CardSetEntity> reportedCardSetOptional = cardSetRepository.findById(cardSetId);
        CardSetEntity reportedCardSet = new CardSetEntity();
        if(reportedCardSetOptional.isPresent()){
            reportedCardSet = reportedCardSetOptional.get();
        }
        reportedCardSet.setReported(true);
        reportedCardSet.setReports(reportedCardSet.getReports() + 1);
        cardSetRepository.save(reportedCardSet);
    }

    public void reportCard(String CardId){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(CardId);
        CardEntity cardEntity = new CardEntity();
        if (cardEntityOptional.isPresent()){
            cardEntity = cardEntityOptional.get();
            cardEntity.setReported(true);
            cardEntity.setReports(cardEntity.getReports() + 1);
        }
    }


    //TEST
    public CardSetEntity addExample(){
        CardSetEntity cardSet = new CardSetEntity();
        CardEntity card = new CardEntity();

        cardSet.setReported(false);
        cardSet.setReports(0);
        cardSet.setType("Test");
        cardSet.setVersion(0);

        card.setContent("Malte trinkt!");
        card.setReported(true);
        card.setReports(2);
        card.setType("super tolle Karte");

        cardSetRepository.save(cardSet);
        card.setCardSetEntity(cardSet);
        cardRepository.save(card);

        return cardSet;
    }
}
