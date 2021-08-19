package de.dasanten.YourDrinkgame.util;

import de.dasanten.YourDrinkgame.enums.TokenAuth;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;

public class HelperFunctions {

    static String moderationToken = "testAdminToken";

    public static boolean tokenCheckForAllTokens(CardSetEntity cardSetEntity, String token) {
        return token.equals(cardSetEntity.getAdminToken()) || token.equals(cardSetEntity.getEditorToken()) || token.equals(moderationToken);
    }

    public static boolean tokenCheckForAdminToken(CardSetEntity cardSetEntity, String token) {
        return cardSetEntity.getAdminToken().equals(token) || token.equals(moderationToken);
    }

    public static TokenAuth getTokenType(CardSetEntity cardSetEntity, String token) {
        if(token.equals(cardSetEntity.getAdminToken()) || token.equals(moderationToken)) {
            return TokenAuth.ADMIN;
        } else if(token.equals(cardSetEntity.getEditorToken())) {
            return TokenAuth.EDITOR;
        } else {
            return TokenAuth.NOT_AUTHORIZED;
        }
    }
}