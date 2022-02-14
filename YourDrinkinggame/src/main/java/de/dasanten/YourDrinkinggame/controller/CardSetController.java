package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.CardsetApi;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.service.CardSetService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@Controller
@AllArgsConstructor
@CrossOrigin
public class CardSetController implements CardsetApi {

    private final CardSetService cardSetService;

    @Override
    public ResponseEntity<CardSetDto> getCardSetById(String id) {
        try {
            return new ResponseEntity<>(cardSetService.getCardSetById(id), HttpStatus.CREATED);
        } catch (IllegalArgumentException illegalArgumentException) {
            return new ResponseEntity(illegalArgumentException.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public ResponseEntity<List<CardSetBasicDto>> getTopCardSets() {
        try {
            return new ResponseEntity<>(cardSetService.getTopCardSets(), HttpStatus.CREATED);
        } catch (IllegalArgumentException illegalArgumentException) {
            return new ResponseEntity(illegalArgumentException.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public ResponseEntity<CardSetDto> addCardSet(CardSetDto cardSetDto) {
        try {
            return new ResponseEntity<>(cardSetService.addCardSet(cardSetDto), HttpStatus.CREATED);
        } catch (IllegalArgumentException illegalArgumentException) {
            return new ResponseEntity(illegalArgumentException.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public ResponseEntity<CardSetDto> editCardSet(CardSetDto cardSetDto) {
        try {
            return new ResponseEntity<>(cardSetService.editCardSet(cardSetDto), HttpStatus.CREATED);
        } catch (IllegalArgumentException illegalArgumentException) {
            return new ResponseEntity(illegalArgumentException.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public ResponseEntity<Void> deleteCardSet(String id) {
        return CardsetApi.super.deleteCardSet(id);
    }

    @Override
    public ResponseEntity<CardSetBasicDto> favorCardSet(String id) {
        return CardsetApi.super.favorCardSet(id);
    }

    @Override
    public ResponseEntity<CardSetBasicDto> reportCardSet(String id) {
        return CardsetApi.super.reportCardSet(id);
    }
}
