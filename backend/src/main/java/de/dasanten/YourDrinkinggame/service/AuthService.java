package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;

    public String login() {
        String userId = SecurityUtil.getAuthId();
        String eMail = SecurityUtil.getMail();
        Optional<UserEntity> userEntityOptional = userRepository.findById(userId);
        if (userEntityOptional.isPresent()) {
            UserEntity userEntity = userEntityOptional.get();
            return userEntity.getId();
        } else {
            throw new NoSuchElementException("User does not exist");
        }
    }

    public void createUser(String username) {
        if (username.length() < 4) {
            throw new IllegalArgumentException("Name has to be at least 4 characters long");
        }
        String userId = SecurityUtil.getAuthId();
        if (userRepository.existsById(userId)) {
            throw new IllegalArgumentException("The User does already exist");
        }
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setBanned(false);
        userEntity.setUsername(username);
        userEntity.setRole(UserRole.USER);
        userRepository.save(userEntity);
    }

    public String changeUsername(String username) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isPresent()) {
            UserEntity userEntity = userEntityOptional.get();
            userEntity.setUsername(username);
            userRepository.save(userEntity);
            return userEntity.getUsername();
        } else {
            throw new IllegalArgumentException("User not found");
        }

    }

}
