package de.dasanten.YourDrinkgame.repository.entity;

import de.dasanten.YourDrinkgame.enums.CardType;
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
    private CardType type = CardType.NORMAL;
    private boolean isReported = false;
    private int reports = 0;

}
