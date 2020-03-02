package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;

@Data
public class CardDTO {

String id;
String content;
String type;
String cardSetId;
boolean isReported;
int reports;
}
