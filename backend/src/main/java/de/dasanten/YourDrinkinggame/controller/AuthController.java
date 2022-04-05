package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.AuthApi;
import de.dasanten.YourDrinkinggame.service.AuthService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

@Controller
@AllArgsConstructor
@CrossOrigin
public class AuthController implements AuthApi {

    private final AuthService authService;

    @Override
    public ResponseEntity<String> login() {
        return new ResponseEntity<>(authService.login(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<String> changeUsername(String username) {
        return new ResponseEntity<>(authService.changeUsername(username), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Void> register(String username) {
        authService.createUser(username);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
