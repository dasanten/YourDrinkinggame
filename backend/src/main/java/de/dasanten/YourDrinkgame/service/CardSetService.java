package de.dasanten.YourDrinkgame.service;

import de.dasanten.YourDrinkgame.repository.CardSetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CardSetService {

    @Autowired
    CardSetRepository cardSetRepository;

}
