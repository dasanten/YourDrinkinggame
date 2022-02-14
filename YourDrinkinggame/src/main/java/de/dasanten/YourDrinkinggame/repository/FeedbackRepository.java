package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.FeedbackEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackRepository extends JpaRepository<FeedbackEntity, String> {
}
