package de.dasanten.YourDrinkgame.controller;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.service.CardSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class CardSetController {
//    @Autowired
//    CardSetService cardSetService;

    @GetMapping("/cardsets")
    public ResponseEntity<CardSetDTO> getCardSetsById(){
        return null;
    }

}