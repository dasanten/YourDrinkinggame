package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;
    @Autowired
    CardRepository cardRepository;

    public List<CardSetDTO> list (){
       return cardSetRepository.findAll();
    }

    public  CardSetDTO addExample(){
        CardSetDTO c = new CardSetDTO();
        c.setReported(true);
        c.setReports(2);
        c.setType("test");
        CardDTO card = new CardDTO();
        card.setContent("Alle Trinken gleich");
        card.setReported(false);
        card.setReports(0);
        card.setType("testNr1");
        card.setCardSetDTO(c);
        cardSetRepository.save(c);
        cardRepository.save(card);
        return c;
    }

    public CardSetDTO addCardSet(CardSetDTO cardSetDTO){
        cardSetRepository.save(cardSetDTO);
        return cardSetDTO;
    }

    public void reportCardSet(long cardSetId){
        CardSetDTO reportedCardSet = cardSetRepository.findById(cardSetId);
        reportedCardSet.setReported(true);
        reportedCardSet.setReports(reportedCardSet.getReports() + 1);
        cardSetRepository.save(reportedCardSet);
    }

}
