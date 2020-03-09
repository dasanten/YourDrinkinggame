package de.dasanten.YourDrinkgame.controller;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.service.CardSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


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
    public void reportCardSet(@RequestParam Long cardSetId) {
        cardSetService.reportCardSet(cardSetId);
    }
}