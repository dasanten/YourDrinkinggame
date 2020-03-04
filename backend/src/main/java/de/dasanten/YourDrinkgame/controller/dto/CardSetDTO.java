package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

import javax.persistence.Entity;

@Data
@Entity
public class CardSetDTO {

    private Long id;
    private String type;
    private boolean isReported;
    private int reports;
}
