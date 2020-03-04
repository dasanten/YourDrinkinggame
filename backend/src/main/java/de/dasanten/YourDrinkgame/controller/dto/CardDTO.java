package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

import javax.persistence.Entity;

@Data
public class CardDTO {

    private Long id;
    private String content;
    private String type;
    private String cardSetId;
    private boolean isReported;
    private int reports;
}
