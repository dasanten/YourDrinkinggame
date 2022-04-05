package de.dasanten.YourDrinkinggame.mapper;

import de.dasanten.YourDrinkinggame.entity.FeedbackEntity;
import de.dasanten.YourDrinkinggame.model.FeedbackDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface FeedbackMapper {

    @Mapping(target = "user", ignore = true)
    FeedbackEntity toEntity(FeedbackDto feedbackDto);

    FeedbackDto toDto(FeedbackEntity feedbackEntity);
}
