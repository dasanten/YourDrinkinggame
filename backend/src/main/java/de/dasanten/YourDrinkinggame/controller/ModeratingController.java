package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.ModeratingApi;
import de.dasanten.YourDrinkinggame.model.UserDto;
import de.dasanten.YourDrinkinggame.service.moderating.CardSetModeratingService;
import de.dasanten.YourDrinkinggame.service.moderating.UserModeratingService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@Controller
@AllArgsConstructor
@CrossOrigin
public class ModeratingController implements ModeratingApi {

    private final CardSetModeratingService cardSetModeratingService;
    private final UserModeratingService userModeratingService;

    @Override
    public ResponseEntity<Void> modRemoveCard(String cardId) {
        cardSetModeratingService.removeCard(cardId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Void> modRemoveCardSet(String cardSetId) {
        cardSetModeratingService.removeCardSet(cardSetId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Override
    public ResponseEntity<UserDto> banUser(String userId) {
        return new ResponseEntity<>(userModeratingService.banUser(userId), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<UserDto>> getBannedUsers() {
        return new ResponseEntity<>(userModeratingService.getBannedUser(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<UserDto> unbanUser(String userId) {
        return new ResponseEntity<>(userModeratingService.unbanUser(userId), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<UserDto> setUserRole(String eMail, String body) {
        return new ResponseEntity<>(userModeratingService.setUserRole(eMail, body), HttpStatus.OK);
    }
}
