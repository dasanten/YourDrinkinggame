import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/widgets.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/viewmodel/async_viewmodel_base.dart';
import '../data_base/model/card_entity.dart';

class CurrentCardViewmodel extends AsyncViewmodelBase {
  CardEntity? _card;
  CardEntity? _relatedCard;
  CardType? cardType;

  late TextEditingController _contentController;
  late TextEditingController _relatedCardController;

  CurrentCardViewmodel() {
    _contentController = TextEditingController();
    _relatedCardController = TextEditingController();
  }

  CardEntity? get card => _card;
  CardEntity? get relatedCard => _relatedCard;
  TextEditingController get contentController => _contentController;
  TextEditingController get relatedCardController => _relatedCardController;

  void setCard(CardEntity newCard) {
    _card = newCard;
    _contentController.text = newCard.content;
    cardType = newCard.type;
    getRelatedCard();
    notifyListeners();
  }

  void setCardType(CardType? newCardType) {
    cardType = newCardType;
    if ((newCardType?.hasMultipleCards ?? false)) {
      _card = _card?.copyWith(card: relatedCard!.copyWith(cardType: newCardType), cardType: newCardType);
    } else {
      _card = _card?.copyWith(removeRelatedCard: true, cardType: newCardType);
    }
    notifyListeners();
  }

  void getRelatedCard() async {
    _relatedCard = (await getRelatedCardById(_card!.id!)) ?? CardEntity(content: "", active: true, cardSetId: null);
    _relatedCardController.text = _relatedCard!.content;
    if(relatedCard?.content !=null) {
      _card = _card?.copyWith(card: _relatedCard, cardType: cardType);
    }
    notifyListeners();
  }

  void reset() {
    _card = null;
    _relatedCard = null;
    _contentController.text = '';
    _relatedCardController.text = '';
    notifyListeners();
  }

  void save() {   
    _relatedCard = _relatedCard?.copyWith(
      content: relatedCardController.text,
      cardType: cardType,
    );
    _card = _card!.copyWith(
      content: contentController.text,
      card: _card?.card != null ? _relatedCard: null, 
      cardType: cardType,
    );
    notifyListeners();
  }
}
