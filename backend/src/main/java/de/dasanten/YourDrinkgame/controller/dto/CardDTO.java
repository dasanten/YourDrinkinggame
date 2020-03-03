package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

@Data
public class CardDTO {

    private Long id;
    private String content;
    private String type;
    private String cardSetId;
    private boolean isReported;
    private int reports;
}
