package de.dasanten.YourDrinkgame.controller.dto;

import de.dasanten.YourDrinkgame.enums.CardSetType;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Data
public class CardSetDTO {

    private String id;

    private String name;
    private String description;
    private int favorites = 0;
    private CardSetType type;
    private int version;
    private boolean isReported;
    private int reports;
    private String Token;
    private List<CardDTO> cardList;
}
