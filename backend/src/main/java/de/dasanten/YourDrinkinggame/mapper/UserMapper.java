package de.dasanten.YourDrinkinggame.mapper;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.model.UserBasicDto;
import de.dasanten.YourDrinkinggame.model.UserDto;
import de.dasanten.YourDrinkinggame.model.UserWithCardSetRole;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {

    @Mapping(target = "likedSets", ignore = true)
    @Mapping(target = "feedbacks", ignore = true)
    @Mapping(target = "cardSetRoles", ignore = true)
    @Mapping(target = "banned", ignore = true)
    @Mapping(target = "strikes", ignore = true)
    UserEntity toEntity(UserDto userDto);

    @Mapping(target = "eMail", ignore = true)
    UserDto toDto(UserEntity userEntity);

    UserBasicDto toBasicDto(UserEntity userEntity);

    @Mapping(target = "role", source = "cardSetRole")
    UserWithCardSetRole toWithCardSetRole(UserEntity user, CardSetRole cardSetRole);

}
