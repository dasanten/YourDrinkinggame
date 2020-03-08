package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.controller.dto.CardSetDTO;
import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;

    public List<CardSetDTO> list (){
       return cardSetRepository.findAll();
    }

}
