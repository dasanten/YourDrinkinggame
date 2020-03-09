package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity(name = "cardSet")
public class CardSetDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany
    private List<CardDTO> cards;

    private String type;

    private boolean isReported;

    private int reports;
}
