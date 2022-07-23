import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart' as cardSetRepository;
import 'package:your_drinking_game_app/services/user_service.dart';

import '../data_base/model/card_set_entity.dart';

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
    if(currentUserId != null){
      _cardSetList = await cardSetRepository.getCardSetsByUserId(currentUserId!);
    } 
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
      nsfw: false,
    );
    await cardSetRepository.insertCardSet(cardSet, currentUserId!);
    await getCardSets();
  }

  Future<void> updateCardSet(CardSetEntity cardSet) async {
    await cardSetRepository.updateCardSet(cardSet);
    await getCardSets();
  }

  Future<void> deleteCardSet(int id) async {
    await cardSetRepository.deleteCardSet(id);
    await getCardSets();
  }

  Future<bool> importCardSetFromWorkshop(CardSetBasicDto cardSetDto) async {
    // TODO add cardSet from workshop
    // final responseCardSet = await CardSetDB.cardSetDB
        // .insertCardSet(CardSetEntity.fromCardSetDto(cardSetDto));
    // final cardEntityList = cardSetDto.cards!
    //     .map<CardEntity>(
    //       (e) => CardEntity.fromCardDto(e, responseCardSet.id!),
    //     )
    //     .toList();
    
    // await CardSetDB.cardSetDB.insertCardList(cardEntityList);
    await getCardSets();
    return true;
  }
}
