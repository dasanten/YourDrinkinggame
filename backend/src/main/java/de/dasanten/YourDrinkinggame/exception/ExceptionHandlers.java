package de.dasanten.YourDrinkinggame.exception;

import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@ControllerAdvice
public class ExceptionHandlers {

    @ExceptionHandler(value = {NoSuchElementException.class})
    public ResponseEntity<ApiError> handleNotFoundExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(value = {IllegalArgumentException.class})
    public ResponseEntity<ApiError> handleBadRequestExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(value = {MissingPermissionException.class})
    public ResponseEntity<ApiError> handleForbiddenExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.FORBIDDEN);
    }

    private ResponseEntity<ApiError> createApiExceptionResponse(Exception e, HttpStatus httpStatus) {
        ApiError apiError = new ApiError(e.getMessage(), httpStatus);
        return new ResponseEntity<>(apiError, httpStatus);
    }

}
