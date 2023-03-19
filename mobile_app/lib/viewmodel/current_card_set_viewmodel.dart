import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart'
    as card_repository;
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart'
    as card_set_repository;
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/extension/role_extension.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

import '../data_base/model/card_entity.dart';
import '../data_base/model/card_set_entity.dart';
import 'async_view_model_base.dart';

class CurrentCardSetViewmodel extends AsyncViewModelBase {
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

  List<CardEntity> get cards => _cards;

  CardSetRole? get userRole => _cardSetRole;

  TextEditingController get nameController => _nameController;

  TextEditingController get descriptionController => _descriptionController;

  bool get canBeUpdated =>
      _cardSet?.workshopId == null ||
      (_cardSet?.workshopId != null && _cardSetRole != null);

  bool get isPublished => cardSet?.workshopId?.isNotEmpty ?? false;

  bool get canBePublished => _cardSetRole?.canUpdateCardSet ?? false;

  void setCardSet(CardSetEntity newCardSet) {
    _cardSet = newCardSet;
    _nameController.text = _cardSet!.name;
    _descriptionController.text = _cardSet!.description;
    notifyListeners();
    getCards();
    getUserRole();
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

  Future getUserRole() async {
    if (_cardSet != null && currentUserId != null) {
      _cardSetRole =
          await card_set_repository.getUserRole(_cardSet!.id!, currentUserId!);
    }
    notifyListeners();
  }

  Future<void> insertCard(CardEntity card) async {
    await card_repository.insertCard(card);
    await getCards();
  }

  Future<void> insertCardFromContent(
      String content1, String content2, CardType? cardType) async {
    CardEntity? relatedCard;
    if (cardType!.hasMultipleCards) {
      relatedCard = await card_repository.insertCard(CardEntity(
        content: content2,
        active: true,
        cardSetId: null,
        type: cardType,
      ));
    }
    final card = CardEntity(
      active: true,
      cardSetId: _cardSet!.id!,
      content: content1,
      type: cardType,
      card: relatedCard,
    );
    await insertCard(card);
  }

  Future<void> updateCard(CardEntity card) async {
    if (card.card != null) {
      if (card.card?.id == null) {
        card =
            card.copyWith(card: await card_repository.insertCard(card.card!));
      } else {
        await card_repository.updateCard(card.card!);
      }
    }
    await card_repository.updateCard(card);
    await getCards();
  }

  Future<void> deleteCard(int id) async {
    await card_repository.deleteCard(id);
    await getCards();
  }

  void save(BuildContext context) {
    _cardSet = _cardSet!.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
    );
    publish(context: context);
    notifyListeners();
  }

  Future publish({BuildContext? context}) async {
    if (_cardSet != null) {
      if (!canUseWorkshop) {
        if (context != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Du musst angemeldet sein um ein set zu veröffentlichen",
              ),
            ),
          );
        }
        return;
      }
      setLoading();
      List<CardEntity> cards = _cards;
      cards = await Future.wait(cards.map(((card) async => card.copyWith(
          card: await card_repository.getRelatedCardById(card.id!)))));
      final cardSet = _cardSet!.toDto(cards);
      var res;
      if (isPublished) {
        res = await api.getCardsetApi().editCardSet(cardSetDto: cardSet);
      } else {
        res = await api.getCardsetApi().addCardSet(cardSetDto: cardSet);
      }
      _cardSet = _cardSet!.copyWith(workshopId: res.data?.id);
      card_set_repository.updateCardSet(_cardSet!);
      setFinished();
    }
  }

  Future unPublish() async {
    if (_cardSet != null) {
      setLoading();
      await api.getCardsetApi().deleteCardSet(id: _cardSet!.workshopId!);
      _cardSet = _cardSet!.copyWith(removeWorkshopId: true);
      card_set_repository.updateCardSet(_cardSet!);
      setFinished();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
