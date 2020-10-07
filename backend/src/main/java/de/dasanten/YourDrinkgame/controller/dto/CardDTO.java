package de.dasanten.YourDrinkgame.controller.dto;

import de.dasanten.YourDrinkgame.enums.CardType;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.UUID;

@Data
public class CardDTO {

    private String id;
    private String cardSetId;
    private String content;
    private CardType type;
    private boolean isReported;
    private int reports;
}
