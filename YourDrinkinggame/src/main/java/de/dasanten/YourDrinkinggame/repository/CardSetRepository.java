package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardSetRepository extends JpaRepository<CardSetEntity, String> {

    @Query(value =
            "SELECT * " +
                    "FROM card_set C " +
                    "ORDER BY (" +
                    "SELECT COUNT(l.card_set_id) FROM user_liked_sets l " +
                    "WHERE l.card_set_id = C.id " +
                    ") DESC " +
                    "LIMIT 20 " +
                    "OFFSET ?1",
            nativeQuery = true)
    List<CardSetEntity> getTopCardSets(int offset);

}
