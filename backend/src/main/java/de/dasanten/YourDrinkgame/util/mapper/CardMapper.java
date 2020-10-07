package de.dasanten.YourDrinkgame.util.mapper;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import de.dasanten.YourDrinkgame.util.mapper.CardSetMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@AllArgsConstructor
public class CardMapper {

    private final CardSetRepository cardSetRepository;

    public CardDTO cardEntityToCardDTO(CardEntity cardEntity){
        CardDTO cardDTO = new CardDTO();
        cardDTO.setId(cardEntity.getId());
        cardDTO.setCardSetId(cardEntity.getCardSet().getId());
        cardDTO.setReported(cardEntity.isReported());
        cardDTO.setReports(cardEntity.getReports());
        cardDTO.setContent(cardEntity.getContent());
        cardDTO.setType(cardEntity.getType());
        return cardDTO;
    }

    public CardEntity cardDTOToCardEntity(CardDTO cardDTO){
        CardEntity cardEntity = new CardEntity();
        if (cardDTO.getId() != null){
            cardEntity.setId(cardDTO.getId());
        }
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTO.getCardSetId());
        cardEntity.setCardSet(cardSetEntityOptional.get());
        cardEntity.setContent(cardDTO.getContent());
        cardEntity.setReported(cardSetEntityOptional.get().isReported());
        cardEntity.setReports(cardSetEntityOptional.get().getReports());
        cardEntity.setType(cardDTO.getType());
        return cardEntity;
    }


}
