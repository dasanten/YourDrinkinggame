import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart' as cardSetRepository;
import 'package:your_drinking_game_app/openapi/api_client.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

import '../data_base/model/card_entity.dart';
import '../data_base/model/card_set_entity.dart';

import 'async_viewmodel_base.dart';

class LocalCardSetsViewmodel extends AsyncViewmodelBase {

  late List<CardSetEntity> _cardSetList;

  List<CardSetEntity> get cardSetList => _cardSetList;

  LocalCardSetsViewmodel() {
    _cardSetList = <CardSetEntity>[];
    getCardSets();
    userEntity.addListener(() {
      if(userEntity.value != null) {
        getCardSets();
      }
    });
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
    await cardSetRepository.insertCardSet(cardSet, currentUserId!, role: CardSetRole.OWNER);
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
    CardSetDto? cardSet = (await api.getCardsetApi().getCardSetById(id: cardSetDto.id!)).data;
    if(cardSet == null) {
      return false;
    }
    CardSetRole? cardSetRole;
    if(canUseWorkshop) {
      cardSetRole = await getCardSetRole(cardSet.id!);
    }
    CardSetEntity cardSetEntity = await cardSetRepository.insertCardSet(CardSetEntity.fromCardSetDto(cardSet), currentUserId!, role: cardSetRole);
    insertCardList((cardSet.cards?.asList() ?? []).map((card) => CardEntity.fromCardDto(card, cardSetEntity.id!)).toList());
    await getCardSets();
    return true;
  }


  Future<CardSetRole?> getCardSetRole(String cardSetId) async {
    final userWithRole = (await api.getConfigureApi().getCardSetSpecialUsers(cardSetId: cardSetId)).data?.asList() ?? [];
    for(final user in userWithRole) {
      if(user.id == currentUser!.workshopId) {
        return user.role;
      }
    }
    return null;
  }
}
