package de.dasanten.YourDrinkgame.controller;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
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

    //GETTER
    @GetMapping("/getCardsetCardsById")
    public ResponseEntity <List<CardDTO>> getCardsetById(@RequestParam String cardSetId) {
        cardSetService.getCardSetCardsById(cardSetId);
        return null;
    }

    @GetMapping("/getCardSetById")
    public ResponseEntity<CardSetDTO> getCardSetById(){
        return null;
    }

    @GetMapping("/getCardOfCardSetById")
    public ResponseEntity<CardDTO> getCardById(){
        return null;
    }

    //SETTER
    @PostMapping("/addCardSet")
    public ResponseEntity<CardSetEntity> addCardSet(@RequestBody CardSetEntity cardSetDTO){
        cardSetService.addCardSet(cardSetDTO);
        return null;
    }

    @PostMapping("/addCards")
    public ResponseEntity<List<CardDTO>> addCards(){
        return null;
    }


    //EDIT
    @PutMapping("/editCardSet")
    public  ResponseEntity<CardSetDTO> editCardSet(){
        return null;
    }

    @PutMapping("/editCard")
    public ResponseEntity<CardDTO> editCard(){
        return null;
    }

    //DELETE
    @DeleteMapping("/deleteCardSet")
    public ResponseEntity<CardSetDTO> deleteCardSet(){
        return null;
    }

    @DeleteMapping("/deleteCard")
    public ResponseEntity<CardDTO> deleteCard(){
        return null;
    }


    //REPORTS
    @GetMapping("/reportCardSet")
    public void reportCardSet(@RequestParam String cardSetId) {
        cardSetService.reportCardSet(cardSetId);
    }

    @GetMapping("/reportCard")
    public void reportCard(@RequestParam String cardId){

    }


    //TEST
    @GetMapping("/addExample")
    public CardSetEntity addExample(){
        return cardSetService.addExample();
    }
}

