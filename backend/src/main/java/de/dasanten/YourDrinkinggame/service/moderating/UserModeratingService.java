package de.dasanten.YourDrinkinggame.service.moderating;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import de.dasanten.YourDrinkinggame.mapper.UserMapper;
import de.dasanten.YourDrinkinggame.model.UserDto;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import de.dasanten.YourDrinkinggame.util.RoleUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserModeratingService {

    private final UserRepository userRepository;

    private final UserMapper userMapper;

    public UserDto banUser(String userId) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(userId);
        Optional<UserEntity> banningUserOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty() || banningUserOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity banningUser = banningUserOptional.get();
        UserEntity bannedUser = userEntityOptional.get();
        if (RoleUtil.isMod(banningUser.getRole()) && !RoleUtil.isMod(bannedUser.getRole())) {
            bannedUser.setBanned(true);
            return userMapper.toDto(userRepository.save(bannedUser));
        }
        throw new MissingPermissionException("You are not allowed to ban this user");
    }

    public UserDto unbanUser(String userId) {
        Optional<UserEntity> userEntityOptional = userRepository.findById(userId);
        Optional<UserEntity> banningUserOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty() || banningUserOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity banningUser = banningUserOptional.get();
        UserEntity bannedUser = userEntityOptional.get();
        if (RoleUtil.isMod(banningUser.getRole())) {
            bannedUser.setBanned(false);
            return userMapper.toDto(userRepository.save(bannedUser));
        }
        throw new MissingPermissionException("You are not allowed to unban this user");
    }

    public List<UserDto> getBannedUser() {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        if (RoleUtil.isMod(userEntityOptional.get().getRole())) {
            List<UserEntity> userEntityList = userRepository.findByBannedIsTrue();
            List<UserDto> bannedUser = new ArrayList<>();
            userEntityList.forEach(user -> bannedUser.add(userMapper.toDto(user)));
            return bannedUser;
        }
        throw new MissingPermissionException("You are not allowed to see banned user");
    }

    public UserDto setUserRole(String eMail, String roleEnum) {
        Optional<UserEntity>  changeRoleUserOptional = userRepository.findByEMail(eMail);
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty() || changeRoleUserOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity user = changeRoleUserOptional.get();
        user.setRole(UserRole.valueOf(roleEnum));
        return userMapper.toDto(userRepository.save(user));
    }
}
