package de.dasanten.YourDrinkinggame.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity(name = "type")
@Getter
@Setter
@RequiredArgsConstructor
public class CardSetTypeEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    private String name;

    @OneToMany(mappedBy = "type", fetch = FetchType.LAZY)
    private List<CardSetEntity> cardSets;

}
