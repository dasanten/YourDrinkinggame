package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardRepository extends JpaRepository<CardEntity, String> {

    List<CardEntity> findByCardSetEntity(CardSetEntity cardSetEntity);

    CardEntity deleteByCardSetEntity(CardSetEntity cardSetEntity);
}
