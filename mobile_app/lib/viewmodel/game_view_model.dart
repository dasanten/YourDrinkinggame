import 'dart:math';
import 'dart:ui';

import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/viewmodel/async_view_model_base.dart';

import '../data_base/model/card_entity.dart';
import '../data_base/repository/card_repository.dart';

class GameViewModel extends AsyncViewModelBase {
  GameViewModel() {
    loadCards();
  }

  CardEntity _displayedCard = CardEntity(
      content: "Don't drink and drive", active: true, cardSetId: null);

  Color get currentColor => _displayedCard.color;

  String get cardTextWithNames => _replacePlayerNames(_displayedCard.content);

  String? get cardTitle => _displayedCard.type?.title;

  String get replaceString => '@';

  List<String> _players = [];
  List<CardEntity> _cards = [];
  CardEntity? _nextCard;

  set players(List<String> players) {
    _players = players;
  }

  void startGame(List<String> players) {
    _players = players;
    loadCards();
  }

  Future<Null> loadCards() async {
    setLoading();
    _cards = await getActiveCards();
    setFinished();
  }

  Future<Null> pickCard() async {
    CardEntity pickedCard;
    if (_nextCard != null) {
      pickedCard = _nextCard!;
      _nextCard = null;
      _displayedCard = pickedCard;
      notifyListeners();
      return null;
    }
    if (_cards.isEmpty) {
      throw Exception();
    }

    final rdm = Random();
    do {
      final rdmInt = rdm.nextInt(_cards.length);
      pickedCard = _cards[rdmInt];
      pickedCard =
          pickedCard.copyWith(card: await getRelatedCardById(pickedCard.id!));
      _cards.removeAt(rdmInt);
    } while (!_enoughPlayersForCard(pickedCard) && _cards.isNotEmpty);

    if ((pickedCard.type?.hasMultipleCards ?? false) &&
        pickedCard.card != null) {
      if (pickedCard.type == CardType.NEXT) {
        _nextCard = pickedCard.card!;
      } else {
        if (_cards.isEmpty) {
          _cards.insert(rdm.nextInt(_cards.length), pickedCard.card!);
        } else {
          _cards.add(pickedCard.card!);
        }
      }
    }
    _displayedCard = pickedCard;
    notifyListeners();
  }

  String _replacePlayerNames(String content) {
    final players = List.from(_players);
    final rdm = Random();
    return content.replaceAllMapped(replaceString, (match) {
      final pickedPlayerNum = rdm.nextInt(players.length);
      final pickedPlayer = players[pickedPlayerNum];
      players.removeAt(pickedPlayerNum);
      return pickedPlayer;
    });
  }

  bool _enoughPlayersForCard(CardEntity cardEntity) =>
      cardEntity.content.allMatches(replaceString).length < _players.length &&
      (cardEntity.card?.content.allMatches(replaceString).length ?? 0) <
          _players.length;
}
