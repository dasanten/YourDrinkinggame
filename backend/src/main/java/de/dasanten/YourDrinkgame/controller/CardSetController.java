package de.dasanten.YourDrinkgame.controller;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.service.CardSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;


@CrossOrigin
@RestController
public class CardSetController {
    @Autowired
    CardSetService cardSetService;

    @GetMapping("/cardsets")
    public List<CardSetDTO> getCardSetsById(){
        return cardSetService.getCardSets();
    }

    @PostMapping("/addCardSet")
    public CardSetDTO addCardSet(@RequestBody CardSetDTO cardSetDTO){
        return cardSetService.addCardSet(cardSetDTO);
    }

    @GetMapping("/report")
    public void reportCardSet(@RequestParam String cardSetId) {
        cardSetService.reportCardSet(cardSetId);
    }

    @GetMapping("/addExample")
    public CardSetDTO addExample(){
        return cardSetService.addExample();
    }

    @GetMapping("/getCardsetCardsById")
    public List<CardDTO> getCardsetById(@RequestParam String cardSetId) {
        return cardSetService.getCardsetCardsById(cardSetId);
    }
}

