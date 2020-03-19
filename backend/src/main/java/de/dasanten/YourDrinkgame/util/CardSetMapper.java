package de.dasanten.YourDrinkgame.util;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.stereotype.Component;

@Component
public class CardSetMapper {

    public CardSetDTO cardSetEntityToCardSetDTO(CardSetEntity cardSetEntity){
        CardSetDTO cardSetDTO = new CardSetDTO();
        cardSetDTO.setId(cardSetEntity.getId());
        cardSetDTO.setType(cardSetEntity.getType());
        cardSetDTO.setReported(cardSetEntity.isReported());
        cardSetDTO.setReports(cardSetEntity.getReports());
        cardSetDTO.setVersion(cardSetEntity.getVersion());
        return cardSetDTO;
    }

    public CardSetEntity cardSetDTOToCardSetEntity(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = new CardSetEntity();
        if(cardSetDTO.getId() != null){
            cardSetEntity.setId(cardSetDTO.getId());
        }
        cardSetEntity.setReported(cardSetDTO.isReported());
        cardSetEntity.setReports(cardSetDTO.getReports());
        cardSetEntity.setType(cardSetDTO.getType());
        cardSetEntity.setVersion(cardSetDTO.getVersion());
        return cardSetEntity;
    }

}
