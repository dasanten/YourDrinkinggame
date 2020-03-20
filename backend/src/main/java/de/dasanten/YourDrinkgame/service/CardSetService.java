package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;
    @Autowired
    CardRepository cardRepository;



    //GETTER
    public List<CardDTO> getCardSetCardsById(String id){
        Optional <CardSetEntity> cardSetEntityOptional =  cardSetRepository.findById(id);
        CardSetEntity cardSetEntity = cardSetEntityOptional.get();
        cardRepository.findByCardSetEntity(cardSetEntity);
        return null;
    }

    public CardSetDTO getCardSetById(String id){
        return null;
    }

    public CardDTO getCardById(){
        return null;
    }

    public CardSetDTO getCardSetByCardId(){
        return null;
    }


    //SETTER
    public CardSetDTO addCardSet(CardSetEntity cardSetDTO){
        cardSetRepository.save(cardSetDTO);
        return null;
    }

    public List<CardDTO> addCards(){
        return null;
    }


    //EDIT
    public CardSetDTO editCardSet(){
        return null;
    }

    public CardDTO editCard(){
        return null;
    }


    //DELETE
    public CardSetDTO deleteCardSet(){
        return null;
    }

    public CardDTO deleteCard(){
        return null;
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

    public void reportCard(){
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
