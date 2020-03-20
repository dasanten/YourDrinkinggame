package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
public class CardSetDTO {

    private String id;

    private String type;

    private int version;

    private boolean isReported;

    private int reports;

}
