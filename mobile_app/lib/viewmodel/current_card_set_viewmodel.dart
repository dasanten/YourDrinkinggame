import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/widgets.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart' as card_repository;
import '../data_base/model/card_entity.dart';
import '../data_base/model/card_set_entity.dart';

import 'async_viewmodel_base.dart';

class CurrentCardSetViewmodel extends AsyncViewmodelBase {
  late List<CardEntity> _cards;
  CardSetEntity? _cardSet;
  CardSetRole? _cardSetRole;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  CurrentCardSetViewmodel([this._cardSet]) {
    _cards = <CardEntity>[];
    _nameController = TextEditingController(
      text: _cardSet?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: _cardSet?.description ?? '',
    );
  }

  CardSetEntity? get cardSet => _cardSet;
  List<CardEntity> get cards => _cards ;
  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  
  bool get canBeUpdated => _cardSet != null && _cardSet!.workshopId == null;

  void setCardSet(CardSetEntity newCardSet) {
    _cardSet = newCardSet;
    _nameController.text = _cardSet!.name;
    _descriptionController.text = _cardSet!.description;
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
      _cards = await card_repository.getCards(_cardSet!.id!);
      setFinished();
    }
  }

  Future<void> insertCard(CardEntity card) async {
    await card_repository.insertCard(card);
    await getCards();
  }

  Future<void> insertCardFromContent(String content) async {
    final card = CardEntity(
      active: true,
      cardSetId: _cardSet!.id!,
      content: content,
    );
    await insertCard(card);
  }

  Future<void> updateCard(CardEntity card) async {
    await card_repository.updateCard(card);
    await getCards();
  }

  Future<void> deleteCard(int id) async {
    await card_repository.deleteCard(id);
    await getCards();
  }

  void save() {
    _cardSet = _cardSet!.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
      // TODO Gucken was jetzt gemacht werden muss (Publish to workshop)
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
