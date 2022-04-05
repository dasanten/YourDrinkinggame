import 'package:flutter/widgets.dart';
import '../data_base/models/card_entity.dart';

class CurrentCardViewmodel extends ChangeNotifier {
  CardEntity? _card;
  late TextEditingController _contentController;

  CurrentCardViewmodel() {
    _contentController = TextEditingController();
  }

  CardEntity? get card => _card;
  TextEditingController get contentController => _contentController;

  void setCard(CardEntity newCard) {
    _card = newCard;
    _contentController.text = newCard.content;
    notifyListeners();
  }

  void reset() {
    _card = null;
    _contentController.text = '';
    notifyListeners();
  }

  void save() {
    _card = _card!.copyWith(
      content: contentController.text,
    );
    notifyListeners();
  }
}
