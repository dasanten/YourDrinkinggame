package de.dasanten.YourDrinkgame.repository;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CardSetRepository extends CrudRepository<CardSetDTO, Long> {

    CardSetDTO findbyId(long id);
}
