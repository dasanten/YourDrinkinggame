package de.dasanten.YourDrinkinggame.entity.keys;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@RequiredArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class CardSetRoleKey implements Serializable {

    @Column(name = "card_set_id")
    private String cardSetId;

    @Column(name = "user_id")
    private String userId;


}
