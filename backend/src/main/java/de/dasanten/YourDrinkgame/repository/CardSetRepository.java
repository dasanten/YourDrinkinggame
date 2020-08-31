package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface CardSetRepository extends JpaRepository<CardSetEntity, String> {

    CardSetEntity findCardSetByCards(CardEntity card);

}
