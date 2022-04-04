package de.dasanten.YourDrinkinggame.service.moderating;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import de.dasanten.YourDrinkinggame.repository.CardRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRepository;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static de.dasanten.YourDrinkinggame.util.RoleUtil.*;

@Service
@RequiredArgsConstructor
public class CardSetModeratingService {

    private final CardSetRepository cardSetRepository;
    private final CardRepository cardRepository;
    private final UserRepository userRepository;

    public void removeCardSet(String cardSetId) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity user = userEntityOptional.get();
        if (!isMod(user.getRole())) {
            throw new MissingPermissionException("You are not allowed to delete this set");
        }
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetId);
        if (cardSetEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("CardSet does not exist");
        }
        CardSetEntity cardSet = cardSetEntityOptional.get();
        validateUserCardSetPermission(cardSet, user);
        userRepository.strike(cardSet.getCardSetRoles().stream()
                .filter(cardSetRoleEntity ->
                    cardSetRoleEntity.getRole().equals(CardSetRole.OWNER)).findAny()
                    .orElseThrow(()-> new IllegalArgumentException("User does not exist")).getUser().getId());
        cardSetRepository.deleteById(cardSetId);
    }

    public void removeCard(String cardId) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity user = userEntityOptional.get();
        if (!isHelper(user.getRole())) {
            throw new MissingPermissionException("You are not allowed to delete this card");
        }
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findByCardsId(cardId);
        if (cardSetEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("card does not exist");
        }
        CardSetEntity cardSet = cardSetEntityOptional.get();
        validateUserCardSetPermission(cardSet, user);
        cardRepository.deleteById(cardId);
    }

    private void validateUserCardSetPermission(CardSetEntity cardSet, UserEntity user) {
        if (isMod(cardSet.getCardSetRoles().stream()
                .filter(cardSetRoleEntity -> cardSetRoleEntity.getRole().equals(CardSetRole.OWNER))
                .findAny().orElseThrow(() -> new IllegalArgumentException("User does not exist")).getUser().getRole()) && !isAdmin(user.getRole())) {
            throw new MissingPermissionException("You are not allowed to delete a set from user with permission");
        }
    }
}
