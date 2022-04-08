package de.dasanten.YourDrinkinggame.exception;

import lombok.Data;
import org.springframework.http.HttpStatus;

import java.time.ZonedDateTime;

@Data
public class ApiError {

    private final String message;
    private final HttpStatus httpStatus;
    private final ZonedDateTime timestamp = ZonedDateTime.now();
}
