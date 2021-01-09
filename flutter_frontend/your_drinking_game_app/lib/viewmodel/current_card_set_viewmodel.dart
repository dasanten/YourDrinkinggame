import 'package:flutter/widgets.dart';

import '../dataBase/CardSetDB.dart';
import '../models/CardEntity.dart';
import '../models/CardSetEntity.dart';
import 'async_viewmodel_base.dart';

class CurrentCardSetViewmodel extends AsyncViewmodelBase {
  List<CardEntity> _cards;
  CardSetEntity _cardSet;
  TextEditingController _nameController;
  TextEditingController _descriptionController;

  CurrentCardSetViewmodel([this._cardSet]) {
    _cards = <CardEntity>[];
    _nameController = TextEditingController(
      text: _cardSet?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: _cardSet?.description ?? '',
    );
  }

  CardSetEntity get cardSet => _cardSet;
  List<CardEntity> get cards => _cards ?? [];
  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;

  void setCardSet(CardSetEntity newCardSet) {
    _cardSet = newCardSet;
    _nameController.text = _cardSet.name;
    _descriptionController.text = _cardSet.description;
    notifyListeners();
    getCards();
  }

  void reset() {
    _cardSet = null;
    _cards = [];
    notifyListeners();
  }

  Future<void> getCards() async {
    if (_cardSet != null) {
      setLoading();
      _cards = await CardSetDB.cardSetDB.getCards(_cardSet.id);
      setFinished();
    }
  }

  Future<void> insertCard(CardEntity card) async {
    await CardSetDB.cardSetDB.insertCard(card);
    await getCards();
  }

  Future<void> insertCardFromContent(String content) async {
    final card = CardEntity(
      active: true,
      cardSetId: _cardSet.id,
      content: content,
    );
    await insertCard(card);
  }

  Future<void> updateCard(CardEntity card) async {
    await CardSetDB.cardSetDB.updateCard(card);
    await getCards();
  }

  Future<void> deleteCard(int id) async {
    await CardSetDB.cardSetDB.deleteCard(id);
    await getCards();
  }

  void save() {
    _cardSet = _cardSet.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
