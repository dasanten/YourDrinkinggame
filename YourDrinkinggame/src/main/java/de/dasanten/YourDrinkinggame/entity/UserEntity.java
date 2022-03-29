package de.dasanten.YourDrinkinggame.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.List;

@Entity(name = "user")
@Getter
@Setter
@RequiredArgsConstructor
public class UserEntity {

    @Id
    private String id;

    private String username;

    private String eMail;

    private boolean banned;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @OneToMany(mappedBy = "user")
    private List<FeedbackEntity> feedbacks;

    @OneToMany(mappedBy = "user")
    private List<CardSetRoleEntity> cardSetRoles;

    @ManyToMany(mappedBy = "likes", cascade = CascadeType.ALL)
    private List<CardSetEntity> likedSets;
}
