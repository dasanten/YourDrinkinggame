package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "cards")
public class CardDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "card_Set_Id")
    private CardSetDTO cardSetDTO;

    private String content;
    private String type;
    private boolean isReported;
    private int reports;
}
