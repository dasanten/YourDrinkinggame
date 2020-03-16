package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;
    @Autowired
    CardRepository cardRepository;

    public List<CardSetDTO> getCardSets (){
       return cardSetRepository.findAll();
    }

    public CardSetDTO addCardSet(CardSetDTO cardSetDTO){
        cardSetRepository.save(cardSetDTO);
        return cardSetDTO;
    }

    public void reportCardSet(String cardSetId){
        CardSetDTO reportedCardSet = cardSetRepository.findById(cardSetId);
        reportedCardSet.setReported(true);
        reportedCardSet.setReports(reportedCardSet.getReports() + 1);
        cardSetRepository.save(reportedCardSet);
    }

    public CardSetDTO addExample(){
        CardSetDTO cardSet = new CardSetDTO();
        CardDTO card = new CardDTO();

        cardSet.setReported(false);
        cardSet.setReports(0);
        cardSet.setType("Test");

        card.setContent("Malte trinkt!");
        card.setReported(true);
        card.setReports(2);
        card.setType("super tolle Karte");
        cardSet.addCard(card);
        //card.setCardSetDTO(cardSet);
        
        cardSetRepository.save(cardSet);
        cardRepository.save(card);

        return cardSet;
    }

    public List<CardDTO> getCardsetCardsById(String id){
        List<CardDTO> cardSetCards = cardRepository.findByCardSetDTO(cardSetRepository.findById(id));
        return cardSetCards;
    }

}
