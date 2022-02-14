package de.dasanten.YourDrinkinggame.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;

import javax.persistence.*;
import java.util.List;

@Entity(name = "category")
@Getter
@Setter
@RequiredArgsConstructor
public class CardSetCategoryEntity {

    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid2")
    private String id;

    private String name;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<CardSetEntity> cardSets;

}
