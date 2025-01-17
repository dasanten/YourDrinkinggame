package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.CardsetApi;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.model.CardSetVersionDto;
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
        return new ResponseEntity<>(cardSetService.getCardSetById(id), HttpStatus.CREATED);
    }

    @Override
    public ResponseEntity<List<CardSetBasicDto>> getTopCardSets(Integer start) {
        return new ResponseEntity<>(cardSetService.getTopCardSets(start), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CardSetBasicDto>> searchCardSets(String query, Integer start) {
        return new ResponseEntity<>(cardSetService.searchCardSets(start, query), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CardSetDto> addCardSet(CardSetDto cardSetDto) {
        return new ResponseEntity<>(cardSetService.addCardSet(cardSetDto), HttpStatus.CREATED);
    }

    @Override
    public ResponseEntity<CardSetDto> editCardSet(CardSetDto cardSetDto) {
        return new ResponseEntity<>(cardSetService.editCardSet(cardSetDto), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Void> deleteCardSet(String id) {
        cardSetService.deleteCardSet(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CardSetBasicDto> favorCardSet(String id) {
        cardSetService.favor(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CardSetBasicDto> reportCardSet(String id) {
        cardSetService.report(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CardSetDto>> getNewestCardSetVersions(List<CardSetVersionDto> cardSetVersionDto) {
        return new ResponseEntity<>(cardSetService.getNewestCardSetVersions(cardSetVersionDto), HttpStatus.OK);
    }
}
