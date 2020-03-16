package de.dasanten.YourDrinkgame.controller.dto;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Data
@Entity(name = "cardSet")
public class CardSetDTO {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    private String id;

    @OneToMany(mappedBy = "cardSetDTO"
//            cascade = CascadeType.ALL,
//            orphanRemoval = true)
    )
    private List<CardDTO> cards = new ArrayList<>();

    private String type;

    private boolean isReported;

    private int reports;

    public void addCard(CardDTO cardDTO){
        cards.add(cardDTO);
//        cardDTO.setCardSetDTO(this);
    }
}
