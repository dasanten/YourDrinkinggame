package de.dasanten.YourDrinkgame.Repository;

import lombok.Data;

import java.util.ArrayList;

@Data
public class CardSetDTO {

String id;
ArrayList<CardSetDTO> cards;
String type;
boolean isReported;
int reports;
}
