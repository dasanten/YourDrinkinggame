package de.dasanten.YourDrinkgame.util.mapper;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
@AllArgsConstructor
public class CardSetMapper {

    private final CardSetRepository cardSetRepository;
    private final CardMapper cardMapper;

    public CardSetDTO cardSetEntityToCardSetDTO(CardSetEntity cardSetEntity, String token){
        CardSetDTO cardSetDTO = new CardSetDTO();
        cardSetDTO.setId(cardSetEntity.getId());
        cardSetDTO.setName(cardSetEntity.getName());
        cardSetDTO.setDescription(cardSetEntity.getDescription());
        cardSetDTO.setType(cardSetEntity.getType());
        cardSetDTO.setReported(cardSetEntity.isReported());
        cardSetDTO.setReports(cardSetEntity.getReports());
        cardSetDTO.setVersion(cardSetEntity.getVersion());
        List<CardDTO> cardDTOS = new ArrayList<>();
        for (CardEntity cardEntity: cardSetEntity.getCards()) {
            cardDTOS.add(cardMapper.cardEntityToCardDTO(cardEntity));
        }
        cardSetDTO.setCardList(cardDTOS);
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
        cardSetDTO.setDescription(cardSetEntity.getDescription());
        cardSetDTO.setFavorites(cardSetEntity.getFavorites());
        cardSetDTO.setType(cardSetEntity.getType());
        cardSetDTO.setReported(cardSetEntity.isReported());
        cardSetDTO.setReports(cardSetEntity.getReports());
        cardSetDTO.setVersion(cardSetEntity.getVersion());
        List<CardDTO> cardDTOS = new ArrayList<>();
        for (CardEntity cardEntity: cardSetEntity.getCards()) {
            cardDTOS.add(cardMapper.cardEntityToCardDTO(cardEntity));
        }
        cardSetDTO.setCardList(cardDTOS);
        return cardSetDTO;
    }

    public CardSetEntity cardSetDTOToCardSetEntity(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = new CardSetEntity();
        Optional <CardSetEntity> cardSet = cardSetRepository.findById(cardSetEntity.getId());
        if(cardSetDTO.getId() != null){
            cardSetEntity.setId(cardSetDTO.getId());
        }
        cardSetEntity.setName(cardSetDTO.getName());
        cardSetEntity.setDescription(cardSetDTO.getDescription());
        cardSetEntity.setFavorites(cardSet.get().getFavorites());
        cardSetEntity.setReported(cardSet.get().isReported());
        cardSetEntity.setReports(cardSet.get().getReports());
        cardSetEntity.setType(cardSetDTO.getType());
        cardSetEntity.setVersion(cardSetDTO.getVersion());
        cardSetEntity.setAdminToken(cardSet.get().getAdminToken());
        cardSetEntity.setEditorToken(cardSet.get().getEditorToken());
        return cardSetEntity;
    }

}
