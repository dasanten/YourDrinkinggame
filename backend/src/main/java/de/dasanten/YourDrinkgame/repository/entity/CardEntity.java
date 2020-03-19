package de.dasanten.YourDrinkgame.repository.entity;

import lombok.Data;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class CardEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private String id;
    private CardSetEntity cardSetEntity;
    private String content;
    private String type;
    private boolean isReported;
    private int reports;

}
