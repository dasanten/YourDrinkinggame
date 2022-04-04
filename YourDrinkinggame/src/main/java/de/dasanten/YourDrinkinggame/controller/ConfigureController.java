package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.ConfigureApi;
import de.dasanten.YourDrinkinggame.model.UserDto;
import de.dasanten.YourDrinkinggame.model.UserWithCardSetRole;
import de.dasanten.YourDrinkinggame.service.ConfigureService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@Controller
@AllArgsConstructor
@CrossOrigin
public class ConfigureController implements ConfigureApi {

    private final ConfigureService configureService;

    @Override
    public ResponseEntity<UserDto> cardSetChangeUserRole(String cardSetId, String eMail, String body) {
        return new ResponseEntity<>(configureService.cardSetChangeUserRole(cardSetId, eMail, body), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<UserWithCardSetRole>> getCardSetSpecialUsers(String cardSetId) {
        return new ResponseEntity<>(configureService.getCardSetSpecialUsers(cardSetId), HttpStatus.OK);
    }
}
