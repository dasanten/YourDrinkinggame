package de.dasanten.YourDrinkinggame.exception.custom;

public class MissingPermissionException extends RuntimeException{

    public MissingPermissionException(String message) {
        super(message);
    }
}
