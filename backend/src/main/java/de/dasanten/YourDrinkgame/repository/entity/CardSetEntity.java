package de.dasanten.YourDrinkgame.repository.entity;

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
    private String type;
    private int version;
    private boolean isReported;
    private int reports;
    private String adminToken;
    private String editorToken;
}
