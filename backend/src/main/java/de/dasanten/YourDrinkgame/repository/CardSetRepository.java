package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CardSetRepository extends JpaRepository<CardSetEntity, String> {

    CardSetEntity findCardSetByCardsId(String cardId);

    List<CardSetEntity> findTop30ByOrderByFavoritesDesc();

}
