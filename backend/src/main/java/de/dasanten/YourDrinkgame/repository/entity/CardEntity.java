package de.dasanten.YourDrinkgame.repository.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;

@Getter
@Setter
@Entity(name = "card")
public class CardEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_set_id")
    private CardSetEntity cardSet;

    private String content;
    private String type;
    private boolean isReported;
    private int reports;

}
