package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.CardSetCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CardSetCategoryRepository extends JpaRepository<CardSetCategoryEntity, String> {

    Optional<CardSetCategoryEntity> findByName(String name);
}
