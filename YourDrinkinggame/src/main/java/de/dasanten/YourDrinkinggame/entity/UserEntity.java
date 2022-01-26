package de.dasanten.YourDrinkinggame.entity;

import de.dasanten.YourDrinkinggame.entity.enums.AppRole;
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
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    private String username;

    private boolean banned;

    @Enumerated(EnumType.STRING)
    private AppRole role;

    @OneToMany(mappedBy = "user")
    private List<FeedbackEntity> feedbacks;

    @OneToMany(mappedBy = "user")
    private List<CardSetRoleEntity> cardSetRoles;

    @ManyToMany(mappedBy = "likes")
    private List<CardSetEntity> likedSets;
}
