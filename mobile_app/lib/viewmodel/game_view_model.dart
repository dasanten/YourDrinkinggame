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

  late CardEntity _displayedCard;

  Color get currentColor => _displayedCard.color;

  String get cardTextWithNames => _replacePlayerNames(_displayedCard.content);

  String? get cardTitle => _displayedCard.type?.title;

  String get replaceString => '@';

  List<String> players = [];
  List<CardEntity> _cards = [];
  CardEntity? _nextCard;

  void removePlayer(String player) {
    players.remove(player);
    notifyListeners();
  }

  void addPlayer(String player) {
    players.add(player);
    notifyListeners();
  }

  void startGame(List<String> newPlayers) {
    players = newPlayers;
    loadCards();
  }

  Future<Null> loadCards() async {
    _displayedCard = CardEntity(
        content: "Don't drink and drive", active: true, cardSetId: null);
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
    final playersCopy = List.from(players);
    final rdm = Random();
    return content.replaceAllMapped(replaceString, (match) {
      final pickedPlayerNum = rdm.nextInt(playersCopy.length);
      final pickedPlayer = playersCopy[pickedPlayerNum];
      playersCopy.removeAt(pickedPlayerNum);
      return pickedPlayer;
    });
  }

  bool _enoughPlayersForCard(CardEntity cardEntity) =>
      replaceString.allMatches(cardEntity.content).length < players.length &&
      replaceString.allMatches(cardEntity.card?.content ?? '').length <
          players.length;
}
