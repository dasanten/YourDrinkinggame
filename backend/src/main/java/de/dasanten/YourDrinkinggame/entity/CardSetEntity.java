package de.dasanten.YourDrinkinggame.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity(name = "card_set")
@Getter
@Setter
@RequiredArgsConstructor
public class CardSetEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_id")
    private CardSetCategoryEntity category;

    private String name;

    private String description;

    private int version;

    private int reports;

    private boolean nsfw;

    @OneToMany(mappedBy = "cardSet", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CardEntity> cards;

    @OneToMany(mappedBy = "cardSet", cascade = CascadeType.ALL)
    private List<CardSetRoleEntity> cardSetRoles;

    @ManyToMany
    @JoinTable(name = "user_liked_sets",
            joinColumns = @JoinColumn(name = "card_set_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<UserEntity> likes;

}
