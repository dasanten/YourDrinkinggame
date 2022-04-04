package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.FeedbackEntity;
import de.dasanten.YourDrinkinggame.mapper.FeedbackMapper;
import de.dasanten.YourDrinkinggame.model.FeedbackDto;
import de.dasanten.YourDrinkinggame.repository.FeedbackRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FeedbackService {

    private final FeedbackRepository feedbackRepository;

    private final FeedbackMapper feedbackMapper;

    public void sendFeedback(FeedbackDto feedbackDto) {
        FeedbackEntity feedback = feedbackMapper.toEntity(feedbackDto);
        feedbackRepository.save(feedback);
    }

    public List<FeedbackDto> getUserFeedback() {
        List<FeedbackEntity> feedbackEntityList = feedbackRepository.findAll();
        List<FeedbackDto> feedbackDtoList = new ArrayList<>();
        feedbackEntityList.forEach(feedbackEntity -> feedbackDtoList.add(feedbackMapper.toDto(feedbackEntity)));
        return feedbackDtoList;
    }
}
