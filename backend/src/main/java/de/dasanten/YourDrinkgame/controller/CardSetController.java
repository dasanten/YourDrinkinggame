package de.dasanten.YourDrinkgame.controller;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import de.dasanten.YourDrinkgame.service.CardSetService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@CrossOrigin
@Controller
@AllArgsConstructor
public class CardSetController {

    private CardSetService cardSetService;

    //GETTER
    @GetMapping("/getCardSetCardsById")
    public ResponseEntity <List<CardDTO>> getCardsByCardSetId(@RequestParam String cardSetId) {
        List<CardDTO> cardDTOList = cardSetService.getCardSetCardsById(cardSetId);
        if (cardDTOList != null) {
            return new ResponseEntity<>(cardDTOList, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/getCardSetById")
    public ResponseEntity<CardSetDTO> getCardSetById(@RequestParam String cardSetId){
        CardSetDTO cardSetDTO = cardSetService.getCardSetById(cardSetId);
        if (cardSetDTO != null){
            return new ResponseEntity<>(cardSetDTO, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/getCardById")
    public ResponseEntity<CardDTO> getCardById(@RequestParam String cardId){
        CardDTO cardDTO = cardSetService.getCardById(cardId);
        if (cardDTO != null) {
            return new ResponseEntity<>(cardDTO, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/getCardSetByCardId")
    public ResponseEntity<CardSetDTO> getCardSetByCardId(@RequestParam String cardId){
        CardSetDTO cardSetDTO = cardSetService.getCardSetByCardId(cardId);
        if (cardSetDTO != null) {
            return new ResponseEntity<>(cardSetDTO, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/checkToken")
    public ResponseEntity<Boolean> checkToken(@RequestBody CardSetDTO cardSetDTO){
        Boolean tokenIs = cardSetService.checkToken(cardSetDTO);
        return new ResponseEntity<>(tokenIs, HttpStatus.OK);
    }

    //SETTER
    @PostMapping("/addCardSet")
    public ResponseEntity<CardSetDTO> addCardSet(@RequestBody CardSetDTO cardSetDTO){
        CardSetDTO addedCardSet = cardSetService.addCardSet(cardSetDTO);
        return new ResponseEntity<>(addedCardSet, HttpStatus.OK);
    }

    @PostMapping("/addCards")
    public ResponseEntity<List<CardDTO>> addCards(@RequestBody List<CardDTO> cardDTOList, @RequestParam String token){
        List<CardDTO> addedCards = cardSetService.addCards(cardDTOList);
        return new ResponseEntity<>(addedCards, HttpStatus.OK);
    }

    @PostMapping("/setEditorToken")
    public ResponseEntity<CardSetDTO> setEditorToken(@RequestBody CardSetDTO cardSetDTO, @RequestParam String editorToken){
        CardSetDTO cardSetWithToken = cardSetService.setEditorToken(cardSetDTO, editorToken);
        return new ResponseEntity<>(cardSetWithToken, HttpStatus.OK);
    }


    //EDIT
    @PutMapping("/editCardSet")
    public  ResponseEntity<CardSetDTO> editCardSet(@RequestBody CardSetDTO cardSetDTO){
        CardSetDTO editedCardSet = cardSetService.editCardSet(cardSetDTO);
        if (editedCardSet != null){
            return new ResponseEntity<>(editedCardSet, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/editCard")
    public ResponseEntity<CardDTO> editCard(@RequestBody CardDTO cardDTO){
        CardDTO editedCard = cardSetService.editCard(cardDTO);
        if (editedCard != null){
            return new ResponseEntity<>(editedCard, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }


    //DELETE
    @DeleteMapping("/deleteCardSet")
    public ResponseEntity<Void> deleteCardSet(@RequestParam String cardSetId, String token){
        if (cardSetService.deleteCardSet(cardSetId, token)) {
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return ResponseEntity.badRequest().build();
    }

    @DeleteMapping("/deleteCard")
    public ResponseEntity<Void> deleteCard(@RequestParam String cardId, String token){
        if (cardSetService.deleteCard(cardId, token)) {
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return ResponseEntity.badRequest().build();
    }


    //REPORTS
    @GetMapping("/reportCardSet")
    public void reportCardSet(@RequestParam String cardSetId) {
        cardSetService.reportCardSet(cardSetId);
    }

    @GetMapping("/reportCard")
    public void reportCard(@RequestParam String cardId){
        cardSetService.reportCard(cardId);
    }





    //TEST
    @GetMapping("/addExample")
    public CardSetEntity addExample(){
        return cardSetService.addExample();
    }
}

