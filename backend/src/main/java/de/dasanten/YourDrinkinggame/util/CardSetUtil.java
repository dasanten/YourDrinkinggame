package de.dasanten.YourDrinkinggame.util;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;

import java.util.Arrays;
import java.util.List;

public class CardSetUtil {

    public static void validation(CardSetDto cardSetDto) {
        if (cardSetDto.getName().isEmpty()) {
            throw new IllegalArgumentException("Name value is needed!");
        }
        if (cardSetDto.getCards()==null || cardSetDto.getCards().size()<=0) {
            throw new IllegalArgumentException("Cards needed for CardSet");
        }
        if(cardSetDto.getCards().stream().anyMatch(cardDto -> cardDto.getContent()==null || cardDto.getContent().isEmpty())) {
            throw new IllegalArgumentException("Card Content is needed!");
        }
    }

    public static boolean checkForRole(List<CardSetRoleEntity> cardSetRoles, CardSetRole...role) {
        return cardSetRoles.stream()
                .anyMatch(cardSetRoleEntity ->
                        (cardSetRoleEntity.getUser().getId().equals(SecurityUtil.getAuthId())
                                && Arrays.stream(role).anyMatch(role1 -> role1.equals(cardSetRoleEntity.getRole()))));
    }

    public static boolean hasRole(List<CardSetRoleEntity> cardSetRoles) {
        return cardSetRoles.stream()
                .anyMatch(cardSetRoleEntity -> cardSetRoleEntity.getUser().getId().equals(SecurityUtil.getAuthId()));
    }

    public static CardSetRoleEntity getUserRole(List<CardSetRoleEntity> cardSetRoles, UserEntity user) {
        return cardSetRoles.stream()
                .filter(cardSetRoleEntity -> cardSetRoleEntity.getUser().getId().equals(user.getId())).findAny().orElseThrow(() -> new IllegalArgumentException("User has no Role"));
    }

    public static boolean mainSettingsChanged(CardSetEntity dbCardSet, CardSetEntity newCardSet) {
        return (newCardSet.getName().equals(dbCardSet.getName())
                &&  newCardSet.getDescription().equals(dbCardSet.getDescription())
                && newCardSet.isNsfw()!=dbCardSet.isNsfw());
    }

}
