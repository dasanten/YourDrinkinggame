package de.dasanten.YourDrinkgame.util.mapper;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class CardSetMapper {

    @Autowired
    CardSetRepository cardSetRepository;

    public CardSetDTO cardSetEntityToCardSetDTO(CardSetEntity cardSetEntity, String token){
        CardSetDTO cardSetDTO = new CardSetDTO();
        cardSetDTO.setId(cardSetEntity.getId());
        cardSetDTO.setName(cardSetEntity.getName());
        cardSetDTO.setType(cardSetEntity.getType());
        cardSetDTO.setReported(cardSetEntity.isReported());
        cardSetDTO.setReports(cardSetEntity.getReports());
        cardSetDTO.setVersion(cardSetEntity.getVersion());
        if (token.equals(cardSetEntity.getAdminToken())){
            cardSetDTO.setToken(cardSetEntity.getAdminToken());
        } else if (token.equals(cardSetEntity.getEditorToken())){
            cardSetDTO.setToken(cardSetEntity.getEditorToken());
        }
        return cardSetDTO;
    }

    public CardSetDTO cardSetEntityToCardSetDTO(CardSetEntity cardSetEntity){
        CardSetDTO cardSetDTO = new CardSetDTO();
        cardSetDTO.setId(cardSetEntity.getId());
        cardSetDTO.setName(cardSetEntity.getName());
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
        cardSetEntity.setName(cardSetDTO.getName());
        cardSetEntity.setReported(cardSetDTO.isReported());
        cardSetEntity.setReports(cardSetDTO.getReports());
        cardSetEntity.setType(cardSetDTO.getType());
        cardSetEntity.setVersion(cardSetDTO.getVersion());
        Optional <CardSetEntity> cardSetTokens = cardSetRepository.findById(cardSetEntity.getId());
        cardSetEntity.setAdminToken(cardSetTokens.get().getAdminToken());
        cardSetEntity.setEditorToken(cardSetTokens.get().getEditorToken());
        return cardSetEntity;
    }

}
