package de.dasanten.YourDrinkinggame.mapper;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.model.UserBasicDto;
import de.dasanten.YourDrinkinggame.model.UserDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {

    @Mapping(target = "likedSets", ignore = true)
    @Mapping(target = "feedbacks", ignore = true)
    @Mapping(target = "cardSetRoles", ignore = true)
    @Mapping(target = "banned", ignore = true)
    @Mapping(target = "EMail", source = "eMail")
    @Mapping(target = "strikes", ignore = true)
    UserEntity toEntity(UserDto userDto);

    @Mapping(target = "eMail", source = "EMail")
    UserDto toDto(UserEntity userEntity);

    UserBasicDto toBasicDto(UserEntity userEntity);

}
