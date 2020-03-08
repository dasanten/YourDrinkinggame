package de.dasanten.YourDrinkgame.repository.entity;

import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import lombok.Data;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class CardEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String content;
    private String type;
    private String cardSetId;
    private boolean isReported;
    private int reports;

}
