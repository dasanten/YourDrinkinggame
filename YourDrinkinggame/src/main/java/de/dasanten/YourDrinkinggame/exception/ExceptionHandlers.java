package de.dasanten.YourDrinkinggame.exception;

import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.MethodNotAllowedException;

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

    @ExceptionHandler(value = {MissingPermissionException.class})
    public ResponseEntity<ApiException> handleForbiddenExceptions(Exception e) {
        return createApiExceptionResponse(e, HttpStatus.FORBIDDEN);
    }

//    @ExceptionHandler
//    public ResponseEntity<ApiException> handleInternalErrorExceptions(Exception e) {
//        return createApiExceptionResponse(e, HttpStatus.INTERNAL_SERVER_ERROR);
//    }

    private ResponseEntity<ApiException> createApiExceptionResponse(Exception e, HttpStatus httpStatus) {
        ApiException apiException = new ApiException(e.getMessage(), httpStatus);
        return new ResponseEntity<>(apiException, httpStatus);
    }

}
