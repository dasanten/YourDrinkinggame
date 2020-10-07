package de.dasanten.YourDrinkgame.repository.entity;

import de.dasanten.YourDrinkgame.enums.CardSetType;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;


@Getter
@Setter
@Entity(name = "cardSet")
public class CardSetEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    private String id;

    @OneToMany( mappedBy = "cardSet", fetch = FetchType.LAZY ,cascade = CascadeType.ALL)
    private Set<CardEntity> cards;

    private String name;
    private int favorites = 0;
    private CardSetType type = CardSetType.NORMAL;
    private int version = 0;
    private boolean isReported = false;
    private int reports = 0;
    private String adminToken;
    private String editorToken;
}
