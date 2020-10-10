package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import de.dasanten.YourDrinkgame.util.mapper.CardMapper;
import de.dasanten.YourDrinkgame.util.mapper.CardSetMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import static de.dasanten.YourDrinkgame.util.HelperFunctions.*;

@Service
@AllArgsConstructor
public class CardSetService {

    private final CardSetRepository cardSetRepository;
    private final CardRepository cardRepository;

    private final CardSetMapper cardSetMapper;
    private final CardMapper cardMapper;




    //GETTER
    public List<CardSetDTO> getTopCardSets() {
        List<CardSetEntity> cardSetEntityList = cardSetRepository.findTop30ByOrderByFavoritesDesc();
        List<CardSetDTO> cardSetDTOList = new ArrayList<>();
        for (CardSetEntity cardSetEntity: cardSetEntityList) {
            cardSetDTOList.add(cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity));
        }
        return cardSetDTOList;
    }

    public List<CardDTO> getCardSetCardsById(String id) {
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        List<CardDTO> cardDTOList = new ArrayList<>();
        if (cardSetEntityOptional.isPresent()) {
            List<CardEntity> cardEntityList = cardRepository.findByCardSet(cardSetEntityOptional.get());
            for (CardEntity cardEntity : cardEntityList) {
                cardDTOList.add(cardMapper.cardEntityToCardDTO(cardEntity));
            }
            return cardDTOList;
        }
        return null;
    }

    public CardSetDTO getCardSetById(String id){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        return cardSetEntityOptional.map(cardSetMapper::cardSetEntityToCardSetDTO).orElse(null);
    }

    public CardDTO getCardById(String id){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(id);
        return cardEntityOptional.map(cardMapper::cardEntityToCardDTO).orElse(null);
    }

    public CardSetDTO getCardSetByCardId(String id){
        CardSetEntity cardSetEntity = cardSetRepository.findCardSetByCardsId(id);
        if (cardSetEntity != null) {
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
        }
        return null;
    }

    public boolean checkToken(CardSetDTO cardSetDTO){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        return cardSetEntityOptional.filter(cardSetEntity -> tokenCheckForAllTokens(cardSetEntity, cardSetDTO.getToken())).isPresent();
    }


    //SETTER
    public CardSetDTO addCardSet(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToNewCardSetEntity(cardSetDTO);
        cardSetEntity.setAdminToken(cardSetDTO.getToken());
        cardSetRepository.save(cardSetEntity);
        return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity, cardSetDTO.getToken());
    }

    public List<CardDTO> addCards(List<CardDTO> cardDTOS, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTOS.get(0).getCardSetId());
        if (cardSetEntityOptional.isPresent() && tokenCheckForAllTokens(cardSetEntityOptional.get(), token)) {
            List<CardEntity> cardEntityList = new ArrayList<>();
            for (CardDTO cardDTO : cardDTOS) {
                cardEntityList.add(cardMapper.cardDTOToCardEntity(cardDTO));
            }
            List<CardEntity> cardEntities = cardRepository.saveAll(cardEntityList);
            List<CardDTO> responseCards = new ArrayList<>();
            for (CardEntity cardEntity: cardEntities) {
                responseCards.add(cardMapper.cardEntityToCardDTO(cardEntity));
            }
            return responseCards;
        }
        return null;
    }

    public CardSetDTO setEditorToken(CardSetDTO cardSetDTO, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && tokenCheckForAdminToken(cardSetEntityOptional.get(), cardSetDTO.getToken())){
            CardSetEntity cardSetEntity = cardSetEntityOptional.get();
            cardSetEntity.setEditorToken(token);
            cardSetRepository.save(cardSetEntity);
        }
        return null;
    }

    public CardSetDTO setAdminToken(CardSetDTO cardSetDTO, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && tokenCheckForAdminToken(cardSetEntityOptional.get(), cardSetDTO.getToken())){
            CardSetEntity cardSetEntity = cardSetEntityOptional.get();
            cardSetEntity.setAdminToken(token);
            cardSetRepository.save(cardSetEntity);
        }
        return null;
    }

    //EDIT
    public CardSetDTO editCardSet(CardSetDTO cardSetDTO, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && tokenCheckForAdminToken(cardSetEntityOptional.get(), token)) {
            CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO);
            cardSetEntity.setVersion(cardSetEntity.getVersion() + 1);
            cardSetRepository.save(cardSetEntity);
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
        }
        return null;
    }

    public CardDTO editCard(CardDTO cardDTO, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTO.getCardSetId());
        if (cardSetEntityOptional.isPresent() && tokenCheckForAllTokens(cardSetEntityOptional.get(), token)){
            CardEntity cardEntity = cardRepository.save(cardMapper.cardDTOToCardEntity(cardDTO));
            cardSetEntityOptional.get().setVersion(cardSetEntityOptional.get().getVersion() +1);
            cardSetRepository.save(cardSetEntityOptional.get());
            return cardMapper.cardEntityToCardDTO(cardEntity);
        }
        return null;
    }


    //DELETE
    public boolean deleteCardSet(String cardSetId, String token){
        Optional <CardSetEntity> cardSet = cardSetRepository.findById(cardSetId);
        if (cardSet.isPresent() && tokenCheckForAdminToken(cardSet.get(), token)) {
            cardSetRepository.deleteById(cardSetId);
            return true;
        }
        return false;
    }

    public boolean deleteCard(String cardId, String token){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(cardId);
        if (cardEntityOptional.isPresent()) {
            CardSetEntity cardSetEntity = cardSetRepository.findCardSetByCardsId(cardId);
            if (tokenCheckForAllTokens(cardSetEntity, token)) {
                cardRepository.deleteById(cardId);
                return true;
            }
        }
        return false;
    }



    //REPORTS
    public void reportCardSet(String cardSetId){
        Optional <CardSetEntity> reportedCardSetOptional = cardSetRepository.findById(cardSetId);
        CardSetEntity reportedCardSet = new CardSetEntity();
        if(reportedCardSetOptional.isPresent()){
            reportedCardSet = reportedCardSetOptional.get();
        }
        reportedCardSet.setReported(true);
        reportedCardSet.setReports(reportedCardSet.getReports() + 1);
        cardSetRepository.save(reportedCardSet);
    }

    public void reportCard(String cardId){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(cardId);
        CardEntity cardEntity;
        if (cardEntityOptional.isPresent()){
            cardEntity = cardEntityOptional.get();
            cardEntity.setReported(true);
            cardEntity.setReports(cardEntity.getReports() + 1);
            cardRepository.save(cardEntity);
        }
    }
}
