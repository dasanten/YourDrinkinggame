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
