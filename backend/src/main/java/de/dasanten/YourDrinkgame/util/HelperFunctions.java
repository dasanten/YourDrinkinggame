package de.dasanten.YourDrinkgame.util;

import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;

public class HelperFunctions {

    static String moderationToken = "testAdminToken";

    public static boolean tokenCheckForAllTokens(CardSetEntity cardSetEntity, String token) {
        return token.equals(cardSetEntity.getAdminToken()) || token.equals(cardSetEntity.getEditorToken()) || token.equals(moderationToken);
    }

    public static boolean tokenCheckForAdminToken(CardSetEntity cardSetEntity, String token) {
        return cardSetEntity.getAdminToken().equals(token) || token.equals(moderationToken);
    }

    public static boolean test() {
        return true;
    }
}