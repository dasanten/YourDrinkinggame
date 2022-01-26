package de.dasanten.YourDrinkinggame.entity;

import de.dasanten.YourDrinkinggame.entity.enums.CardType;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity(name = "card")
@Getter
@Setter
@RequiredArgsConstructor
public class CardEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    private String content;

    @Enumerated(EnumType.STRING)
    private CardType type;

    @OneToOne
    @JoinColumn(name = "card_id")
    private CardEntity relativeCard;

    @ManyToOne
    @JoinColumn(name = "card_set_id")
    private CardSetEntity cardSet;

}
