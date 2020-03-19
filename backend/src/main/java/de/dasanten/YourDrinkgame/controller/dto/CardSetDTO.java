package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity(name = "cardSet")
public class CardSetDTO {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    private String id;

    private String type;

    private int version;

    private boolean isReported;

    private int reports;

}
