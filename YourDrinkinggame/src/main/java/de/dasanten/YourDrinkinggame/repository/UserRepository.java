package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {

    @Query("SELECT U FROM user U WHERE U.eMail=?1")
    Optional<UserEntity> findByEMail(String email);

    List<UserEntity> findByBannedIsTrue();
}
