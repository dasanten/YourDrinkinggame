package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

@Data
public class CardSetDTO {

    private Long id;
    private String type;
    private boolean isReported;
    private int reports;
}
