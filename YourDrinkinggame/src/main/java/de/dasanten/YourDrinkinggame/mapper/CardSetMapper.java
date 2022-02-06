package de.dasanten.YourDrinkinggame.mapper;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.model.CardSetBasicDto;
import de.dasanten.YourDrinkinggame.model.CardSetDto;
import de.dasanten.YourDrinkinggame.model.UserBasicDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(componentModel = "spring", uses = CardMapper.class)
public interface CardSetMapper {

    @Mapping(source = "category.name", target = "category")
    CardSetBasicDto toBasicDto(CardSetEntity cardSet);

    @Mapping(target = "reports", ignore = true)
    @Mapping(target = "likes", ignore = true)
    @Mapping(target = "cardSetRoles", ignore = true)
    @Mapping(target = "category", ignore = true)
    CardSetEntity toEntity(CardSetDto cardSet);

    @Mapping(target = "creator", source = "cardSetRoles", qualifiedByName = "cardSetCreators")
    @Mapping(source = "category.name", target = "category")
    CardSetDto toDto(CardSetEntity cardSet);

    @Named("cardSetCreators")
    default UserBasicDto cardSetCreator(List<CardSetRoleEntity> roles) {
        CardSetRoleEntity foundCardSetRole = roles.stream()
                .filter(cardSetRoleEntity -> cardSetRoleEntity.getRole().equals(CardSetRole.ADMIN))
                .findAny().orElse(null);
        if (foundCardSetRole!=null) {
            UserBasicDto userBasicDto = new UserBasicDto();
            userBasicDto.setId(foundCardSetRole.getUser().getId());
            userBasicDto.setUsername(foundCardSetRole.getUser().getUsername());
            return userBasicDto;
        }
        return null;
    }


}
