package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardDTO;
import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import de.dasanten.YourDrinkgame.repository.CardRepository;
import de.dasanten.YourDrinkgame.repository.entity.CardEntity;
import de.dasanten.YourDrinkgame.repository.entity.CardSetEntity;
import de.dasanten.YourDrinkgame.util.CardMapper;
import de.dasanten.YourDrinkgame.util.CardSetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;
    @Autowired
    CardRepository cardRepository;
    @Autowired
    CardSetMapper cardSetMapper;
    @Autowired
    CardMapper cardMapper;





    //GETTER
    public List<CardDTO> getCardSetCardsById(String id) {
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        List<CardDTO> cardDTOList = new ArrayList<>();
        if (cardSetEntityOptional.isPresent()) {
            List<CardEntity> cardEntityList = cardRepository.findByCardSetEntity(cardSetEntityOptional.get());
            for (CardEntity cardEntity : cardEntityList) {
                cardDTOList.add(cardMapper.cardEntityToCardDTO(cardEntity));
            }
            return cardDTOList;
        }
        return null;
    }

    public CardSetDTO getCardSetById(String id){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(id);
        if (cardSetEntityOptional.isPresent()){
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntityOptional.get());
        }
        return null;
    }

    public CardDTO getCardById(String id){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(id);
        if (cardEntityOptional.isPresent()){
            return cardMapper.cardEntityToCardDTO(cardEntityOptional.get());
        }
        return null;
    }

    public CardSetDTO getCardSetByCardId(String id){
        Optional<CardEntity> cardEntityOptional = cardRepository.findById(id);
        if (cardEntityOptional.isPresent()){
            Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardEntityOptional.get().getId());
            if (cardSetEntityOptional.isPresent()){
                return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntityOptional.get());
            }
        }
        return null;
    }

    public boolean checkToken(CardSetDTO cardSetDTO){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && cardSetEntityOptional.get().getAdminToken().equals(cardSetDTO.getToken()) || cardSetEntityOptional.get().getEditorToken().equals(cardSetDTO.getToken())){
            return true;
        }
        return false;
    }


    //SETTER
    public CardSetDTO addCardSet(CardSetDTO cardSetDTO){
        CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO);
        cardSetEntity.setAdminToken(cardSetDTO.getToken());
        cardSetRepository.save(cardSetEntity);
        return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity, cardSetDTO.getToken());
    }

    public List<CardDTO> addCards(List<CardDTO> cardDTOS){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTOS.get(0).getId());
        if (cardSetEntityOptional.isPresent() && cardDTOS.get(0).getCardSetDTO().getToken().equals(cardSetEntityOptional.get().getEditorToken()) || cardDTOS.get(0).getCardSetDTO().getToken().equals(cardSetEntityOptional.get().getAdminToken())) {
            List<CardEntity> cardEntityList = new ArrayList<>();
            for (CardDTO cardDTO : cardDTOS) {
                cardEntityList.add(cardMapper.cardDTOToCardEntity(cardDTO));
            }
            cardRepository.saveAll(cardEntityList);
            return cardDTOS;
        }
        return null;
    }

    public CardSetDTO setEditorToken(CardSetDTO cardSetDTO, String token){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && cardSetDTO.getToken().equals(cardSetEntityOptional.get().getAdminToken())){
            CardSetEntity cardSetEntity = cardSetEntityOptional.get();
            cardSetEntity.setEditorToken(token);
            cardSetRepository.save(cardSetEntity);
        }
        return null;
    }

    //EDIT
    public CardSetDTO editCardSet(CardSetDTO cardSetDTO){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetEntityOptional.isPresent() && cardSetEntityOptional.get().getAdminToken().equals(cardSetDTO.getToken())) {
            CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO);
                //cardSetEntity.setAdminToken(cardSetDTO.getToken());
                cardSetEntity.setVersion(cardSetEntity.getVersion() + 1);
                    cardSetRepository.save(cardSetEntity);
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity);
        }
        return null;
    }

    public CardDTO editCard(CardDTO cardDTO){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTO.getCardSetDTO().getId());
        if (cardSetEntityOptional.isPresent() && cardSetEntityOptional.get().getEditorToken().equals(cardDTO.getCardSetDTO().getToken()) || cardSetEntityOptional.get().getAdminToken().equals(cardDTO.getCardSetDTO().getToken())){
            CardEntity cardEntity = cardRepository.save(cardMapper.cardDTOToCardEntity(cardDTO));
            cardSetEntityOptional.get().setVersion(cardSetEntityOptional.get().getVersion() +1);
            cardSetRepository.save(cardSetEntityOptional.get());
            return cardMapper.cardEntityToCardDTO(cardEntity);
        }
        return null;
    }


    //DELETE
    public CardSetDTO deleteCardSet(CardSetDTO cardSetDTO){
        Optional <CardSetEntity> cardSetToken = cardSetRepository.findById(cardSetDTO.getId());
        if (cardSetToken.isPresent() && cardSetToken.get().getAdminToken().equals(cardSetDTO.getToken())) {
            CardSetEntity cardSetEntity = cardSetMapper.cardSetDTOToCardSetEntity(cardSetDTO);
            cardSetRepository.deleteById(cardSetEntity.getId());
            cardRepository.deleteByCardSetEntity(cardSetEntity);
            return cardSetMapper.cardSetEntityToCardSetDTO(cardSetEntity, cardSetDTO.getToken());
        }
        return null;
    }

    public CardDTO deleteCard(CardDTO cardDTO){
        Optional<CardSetEntity> cardSetEntityOptional = cardSetRepository.findById(cardDTO.getCardSetDTO().getId());
        if (cardSetEntityOptional.isPresent() && cardDTO.getCardSetDTO().getToken().equals(cardSetEntityOptional.get().getAdminToken()) || cardDTO.getCardSetDTO().getToken().equals(cardSetEntityOptional.get().getEditorToken())) {
            CardEntity cardEntity = cardMapper.cardDTOToCardEntity(cardDTO);
            cardRepository.delete(cardEntity);
            return cardMapper.cardEntityToCardDTO(cardEntity);
        }
        return null;
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
        }
    }


    //TEST
    public CardSetEntity addExample(){
        CardSetEntity cardSet = new CardSetEntity();
        CardEntity card = new CardEntity();

        cardSet.setReported(false);
        cardSet.setReports(0);
        cardSet.setType("Test");
        cardSet.setVersion(0);
        cardSet.setName("Basic Set");
        cardSet.setAdminToken("3922");
        cardSet.setEditorToken("LappenToken");

        card.setContent("Malte trinkt!");
        card.setReported(true);
        card.setReports(2);
        card.setType("super tolle Karte");

        cardSetRepository.save(cardSet);
        card.setCardSetEntity(cardSet);
        cardRepository.save(card);

        return cardSet;
    }
}
