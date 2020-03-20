package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.UUID;

@Data
public class CardDTO {

    private String id;
    private CardSetDTO cardSetDTO;
    private String content;
    private String type;
    private boolean isReported;
    private int reports;
}
