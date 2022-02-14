package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CardSetRepository extends JpaRepository<CardSetEntity, String> {



}
