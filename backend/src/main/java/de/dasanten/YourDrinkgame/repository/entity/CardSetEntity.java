package de.dasanten.YourDrinkgame.repository.entity;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.ArrayList;

@Data
public class CardSetEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private ArrayList<CardSetEntity> cards;
    private String type;
    private boolean isReported;
    private int reports;
}
