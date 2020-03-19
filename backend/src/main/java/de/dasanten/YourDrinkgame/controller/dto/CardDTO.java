package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.UUID;

@Data
@Entity(name = "card")
public class CardDTO {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    @ManyToOne()
    @JoinColumn(name = "card_set_id")
    private CardSetDTO cardSetDTO;

    private String content;
    private String type;
    private boolean isReported;
    private int reports;
}
