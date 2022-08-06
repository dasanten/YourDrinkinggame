import 'dart:math';

import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';

String get replaceString => '@';

List<String> _players = [];
List<CardEntity> _cards = [];
CardEntity? _nextCard;

set players(List<String> players) {
  _players = players;
}

Future loadCards() async {
  _cards = await getActiveCards();
}

Future<CardEntity> pickCard() async {
  CardEntity pickedCard;
  if (_nextCard!=null) {
    pickedCard = _nextCard!;
    _nextCard = null;
    return pickedCard;
  }
  if(_cards.isEmpty) {
    throw Exception();
  } 

  final rdm = Random();
  do {
    final rdmInt = rdm.nextInt(_cards.length);
    pickedCard = _cards[rdmInt];
    pickedCard = pickedCard.copyWith(card: await getRelatedCardById(pickedCard.id!)); 
    _cards.removeAt(rdmInt);
  } while (!enoughPlayersForCard(pickedCard) && _cards.isNotEmpty);


  if((pickedCard.type?.hasMultipleCards ?? false) && pickedCard.card != null) {
    if(pickedCard.type == CardType.NEXT) {
      _nextCard = pickedCard.card!;
    } else {
      if(_cards.isEmpty) {
        _cards.insert(rdm.nextInt(_cards.length), pickedCard.card!);
      } else {
        _cards.add(pickedCard.card!);
      }
    }
  }  
  return pickedCard;
}

String replacePlayerNames(String content, List<String> players) {
  final rdm = Random();
  return content.replaceAllMapped(replaceString, (match) {
    final pickedPlayerNum = rdm.nextInt(players.length);
    players.removeAt(pickedPlayerNum);
    return players[pickedPlayerNum];
  });
}

bool enoughPlayersForCard(CardEntity cardEntity) =>
  cardEntity.content.allMatches(replaceString).length < _players.length &&
  (cardEntity.card?.content.allMatches(replaceString).length ?? 0) < _players.length;
