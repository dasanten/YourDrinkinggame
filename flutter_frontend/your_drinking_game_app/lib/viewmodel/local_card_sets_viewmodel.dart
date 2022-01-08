
import '../data_base/card_set_db.dart';
import '../data_base/models/card_entity.dart';
import '../data_base/models/card_set_entity.dart';

import '../http_service/dto/card_set_dto.dart';
import 'async_viewmodel_base.dart';

class LocalCardSetsViewmodel extends AsyncViewmodelBase {

  late List<CardSetEntity> _cardSetList;

  List<CardSetEntity> get cardSetList => _cardSetList;

  LocalCardSetsViewmodel() {
    _cardSetList = <CardSetEntity>[];
    getCardSets();
  }

  Future<void> getCardSets() async {
    setLoading();
    _cardSetList = await CardSetDB.cardSetDB.getCardSets();
    setFinished();
  }

  Future<void> addCardSet(
    String name,
    String description, {
    bool active = true,
  }) async {
    final cardSet = CardSetEntity(
      name: name,
      description: description,
      active: active,
    );
    await CardSetDB.cardSetDB.insertCardSet(cardSet);
    await getCardSets();
  }

  Future<void> updateCardSet(CardSetEntity cardSet) async {
    await CardSetDB.cardSetDB.updateCardSet(cardSet);
    await getCardSets();
  }

  Future<void> deleteCardSet(int id) async {
    await CardSetDB.cardSetDB.deleteCardSet(id);
    await getCardSets();
  }

  Future<bool> importCardSetFromWorkshop(CardSetDto cardSetDto) async {
    final responseCardSet = await CardSetDB.cardSetDB
        .insertCardSet(CardSetEntity.fromCardSetDto(cardSetDto));
    final cardEntityList = cardSetDto.cardList
        .map<CardEntity>(
          (e) => CardEntity.fromCardDto(e, responseCardSet.id!),
        )
        .toList();
    
    await CardSetDB.cardSetDB.insertCardList(cardEntityList);
    await getCardSets();
    return true;
  }
}
