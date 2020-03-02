package de.dasanten.YourDrinkgame.Repository;

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
