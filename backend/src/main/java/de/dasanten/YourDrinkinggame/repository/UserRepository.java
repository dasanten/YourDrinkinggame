package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {

    @Query("SELECT U FROM user U WHERE U.eMail=?1")
    Optional<UserEntity> findByEMail(String email);

    @Transactional
    @Modifying
    @Query("UPDATE user u SET strikes = strikes + 1 WHERE u.id = ?1")
    void strike(String userId);

    List<UserEntity> findByBannedIsTrue();
}
