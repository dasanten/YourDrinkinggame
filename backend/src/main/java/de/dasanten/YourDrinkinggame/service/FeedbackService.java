package de.dasanten.YourDrinkinggame.service;

import de.dasanten.YourDrinkinggame.entity.FeedbackEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import de.dasanten.YourDrinkinggame.exception.custom.MissingPermissionException;
import de.dasanten.YourDrinkinggame.mapper.FeedbackMapper;
import de.dasanten.YourDrinkinggame.model.FeedbackDto;
import de.dasanten.YourDrinkinggame.repository.FeedbackRepository;
import de.dasanten.YourDrinkinggame.repository.UserRepository;
import de.dasanten.YourDrinkinggame.security.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FeedbackService {

    private final FeedbackRepository feedbackRepository;
    private final UserRepository userRepository;

    private final FeedbackMapper feedbackMapper;

    public void sendFeedback(FeedbackDto feedbackDto) {
        FeedbackEntity feedback = feedbackMapper.toEntity(feedbackDto);
        feedbackRepository.save(feedback);
    }

    public List<FeedbackDto> getUserFeedback() {
        Optional<UserEntity> userEntityOptional = userRepository.findById(SecurityUtil.getAuthId());
        if (userEntityOptional.isEmpty()) {
            throw new IllegalArgumentException("User does not exist");
        }
        UserEntity user = userEntityOptional.get();
        if (!(user.getRole().equals(UserRole.SUPER_ADMIN) || user.getRole().equals(UserRole.ADMIN))) {
            throw new MissingPermissionException("You are not allowed to view feedback");
        }

        List<FeedbackEntity> feedbackEntityList = feedbackRepository.findAll();
        List<FeedbackDto> feedbackDtoList = new ArrayList<>();
        feedbackEntityList.forEach(feedbackEntity -> feedbackDtoList.add(feedbackMapper.toDto(feedbackEntity)));
        return feedbackDtoList;
    }
}
