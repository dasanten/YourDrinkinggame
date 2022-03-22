package de.dasanten.YourDrinkinggame.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@ControllerAdvice
public class ExceptionHandlers {

    @ExceptionHandler(value = {NoSuchElementException.class})
    public ResponseEntity<ApiException> handleNotFoundExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(value = {IllegalArgumentException.class})
    public ResponseEntity<ApiException> handleBadRequestExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.BAD_REQUEST);
    }

    private ResponseEntity<ApiException> createApiExceptionResponse(Exception e, HttpStatus httpStatus) {
        ApiException apiException = new ApiException(e.getMessage(), httpStatus);
        return new ResponseEntity<>(apiException, httpStatus);
    }

}
