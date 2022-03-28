package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.CardSetEntity;
import de.dasanten.YourDrinkinggame.entity.CardSetRoleEntity;
import de.dasanten.YourDrinkinggame.entity.UserEntity;
import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.management.relation.Role;
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

    @Query(value =
            "SELECT * " +
                    "FROM card_set C " +
                    "ORDER BY (" +
                    "SELECT COUNT(l.card_set_id) FROM user_liked_sets l " +
                    "WHERE l.card_set_id = C.id " +
                    ") DESC " +
                    "LIMIT 20 " +
                    "OFFSET ?1" +
                    "WHERE C.name LIKE %?2%",
            nativeQuery = true)
    List<CardSetEntity> search(int offset, String search);

    @Query("SELECT CR.role FROM card_set_role CR WHERE CR.user = ?2 AND CR.cardSet = ?1")
    CardSetRole userRole(String cardSetId, String userId);

}
