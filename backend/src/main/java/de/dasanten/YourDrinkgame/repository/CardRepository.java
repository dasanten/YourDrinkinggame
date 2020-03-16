package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CardRepository extends JpaRepository<CardDTO, Long> {

    CardDTO findById(String id);

    List<CardDTO> findByCardSetDTO(CardSetDTO cardSetDTO);
}
