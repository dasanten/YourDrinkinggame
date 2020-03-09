package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<CardDTO, Long> {
}
