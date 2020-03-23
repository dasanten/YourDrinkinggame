package de.dasanten.YourDrinkgame.repository.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Data
@Entity(name = "cardSet")
public class CardSetEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    private String id;

    private String name;
    private String type;
    private int version;
    private boolean isReported;
    private int reports;
    private String adminToken;
    private String editorToken;
}
