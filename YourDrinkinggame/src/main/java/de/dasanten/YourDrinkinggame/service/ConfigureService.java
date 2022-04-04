package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.entity.keys.CardSetRoleKey;
import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import de.dasanten.YourDrinkinggame.mapper.UserMapper;
import de.dasanten.YourDrinkinggame.model.UserDto;
import de.dasanten.YourDrinkinggame.model.UserWithCardSetRole;
import de.dasanten.YourDrinkinggame.repository.CardSetRepository;
import de.dasanten.YourDrinkinggame.repository.CardSetRoleRepository;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import de.dasanten.YourDrinkinggame.util.CardSetUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ConfigureService {

    private final UserRepository userRepository;
    private final CardSetRepository cardSetRepository;
    private final CardSetRoleRepository cardSetRoleRepository;

    private final UserMapper userMapper;

    public UserDto cardSetChangeUserRole(String cardSetId, String eMail, String role) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        Optional<UserEntity> promoteUserOptional = userRepository.findByEMail(eMail);
        if (userEntityOptional.isEmpty() || promoteUserOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetId);
        if (cardSetEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("CardSet does not exist");
        }
        CardSetEntity cardSet = cardSetEntityOptional.get();
        UserEntity user = userEntityOptional.get();
        UserEntity promoteUser = promoteUserOptional.get();
        CardSetRole userRole = CardSetUtil.getUserRole(cardSet.getCardSetRoles(), user).getRole();
        CardSetRole promoteRole = CardSetRole.valueOf(role);
        if (userRole.ordinal() >= promoteRole.ordinal()) {
            throw new MissingPermissionException("User has not the permission to set this role");
        }
        CardSetRoleEntity cardSetRole = createUserRole(cardSet, user, promoteRole);
        cardSetRoleRepository.save(cardSetRole);
        return userMapper.toDto(promoteUser);
    }

    public List<UserWithCardSetRole> getCardSetSpecialUsers(String cardSetId) {
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetId);
        if (cardSetEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("CardSet does not exist");
        }
        List<UserWithCardSetRole> user = new ArrayList<>();
        cardSetEntityOptional.get().getCardSetRoles().forEach(cardSetRoleEntity -> user.add(userMapper.toWithCardSetRole(cardSetRoleEntity.getUser(), cardSetRoleEntity.getRole())));
        return user;
    }

    private CardSetRoleEntity createUserRole(CardSetEntity cardSet, UserEntity user, CardSetRole role) {
        CardSetRoleEntity cardSetRoleEntity = new CardSetRoleEntity();
        cardSetRoleEntity.setRole(role);
        cardSetRoleEntity.setUser(user);
        cardSetRoleEntity.setCardSet(cardSet);
        CardSetRoleKey cardSetRoleKey = new CardSetRoleKey();
        cardSetRoleKey.setCardSetId(cardSet.getId());
        cardSetRoleKey.setUserId(user.getId());
        cardSetRoleEntity.setId(cardSetRoleKey);
        return cardSetRoleEntity;
    }
}

