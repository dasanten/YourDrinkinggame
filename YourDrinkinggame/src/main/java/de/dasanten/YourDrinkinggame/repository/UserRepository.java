package de.dasanten.YourDrinkinggame.repository;

import de.dasanten.YourDrinkinggame.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
}
