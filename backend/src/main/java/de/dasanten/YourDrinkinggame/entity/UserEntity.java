package de.dasanten.YourDrinkinggame.entity;

import de.dasanten.YourDrinkinggame.entity.enums.UserRole;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
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

    private int strikes;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @OneToMany(mappedBy = "user")
    private List<FeedbackEntity> feedbacks;

    @OneToMany(mappedBy = "user")
    private List<CardSetRoleEntity> cardSetRoles;

    @ManyToMany(mappedBy = "likes", cascade = CascadeType.ALL)
    private List<CardSetEntity> likedSets;
}
