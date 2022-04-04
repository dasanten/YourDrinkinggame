package de.dasanten.YourDrinkinggame.controller;

import de.dasanten.YourDrinkinggame.api.FeedbackApi;
import de.dasanten.YourDrinkinggame.model.FeedbackDto;
import de.dasanten.YourDrinkinggame.service.FeedbackService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@Controller
@AllArgsConstructor
@CrossOrigin
public class FeedbackController implements FeedbackApi {

    private final FeedbackService feedbackService;

    @Override
    public ResponseEntity<List<FeedbackDto>> getUserFeedback() {
        return new ResponseEntity<>(feedbackService.getUserFeedback(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Void> sendFeedback(FeedbackDto feedbackDto) {
        feedbackService.sendFeedback(feedbackDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
