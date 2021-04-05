import '../HttpService/Dto/CardSetDto.dart';
import '../dataBase/CardSetDB.dart';
import '../models/CardEntity.dart';
import '../models/CardSetEntity.dart';
import 'async_viewmodel_base.dart';

class LocalCardSetsViewmodel extends AsyncViewmodelBase {
  List<CardSetEntity> _cardSetList;

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
          (e) => CardEntity.fromCardDto(e, responseCardSet.id),
        )
        .toList();
    final responseCards =
        await CardSetDB.cardSetDB.insertCardList(cardEntityList);

    if (responseCardSet != null && responseCards != null) {
      return true;
    }
    return false;
  }
}
