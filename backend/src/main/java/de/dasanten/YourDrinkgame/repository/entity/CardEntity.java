package de.dasanten.YourDrinkgame.repository.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;


import javax.persistence.*;

@Data
@Entity(name = "card")
public class CardEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    @ManyToOne()
    @JoinColumn(name = "card_set_id")
    private CardSetEntity cardSetEntity;

    private String content;
    private String type;
    private boolean isReported;
    private int reports;

}
