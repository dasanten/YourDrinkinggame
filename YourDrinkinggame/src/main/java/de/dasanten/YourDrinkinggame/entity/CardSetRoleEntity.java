package de.dasanten.YourDrinkinggame.entity;

import de.dasanten.YourDrinkinggame.entity.enums.CardSetRole;
import de.dasanten.YourDrinkinggame.entity.keys.CardSetRoleKey;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
public class CardSetRoleEntity {

    @EmbeddedId
    private CardSetRoleKey id;

    @ManyToOne
    @MapsId("cardSetId")
    @JoinColumn(name = "card_set_id")
    private CardSetEntity cardSet;

    @ManyToOne
    @MapsId("userId")
    @JoinColumn(name = "user_id")
    private UserEntity user;

    private CardSetRole role;

}
