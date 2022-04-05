package de.dasanten.YourDrinkinggame.mapper;

import de.dasanten.YourDrinkinggame.entity.CardEntity;
import de.dasanten.YourDrinkinggame.model.CardDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CardMapper {

    @Mapping(target = "card", source = "relativeCard")
    CardDto toDto(CardEntity cardEntity);

    @Mapping(target = "relativeCard", source = "card")
    @Mapping(target = "cardSet", ignore = true)
    CardEntity toEntity(CardDto cardDto);

}
