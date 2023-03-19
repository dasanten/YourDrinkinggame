import 'package:built_collection/built_collection.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/data_base/model/card_set_entity.dart';
import 'package:your_drinking_game_app/data_base/repository/card_repository.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart';

import '../openapi/api_client.dart';

class CardSetsUtil {
  static Future<bool> checkForUpdates() async {
    try {
      // load local sets
      var localCardSets = await getCardSets();
      var versionList = localCardSets
          .map<CardSetVersionDto>((e) => CardSetVersionDto((b) => b
            ..id = e.workshopId
            ..version = e.version))
          .toList();
      versionList.removeWhere(
          (element) => element.id == null || element.version == null);

      // load all sets with new version
      var newCardSets = (await api.getCardsetApi().getNewestCardSetVersions(
              cardSetVersionDto: BuiltList.of(versionList)))
          .data;

      for (var workshopSet in newCardSets!) {
        // find corresponding local set for new version
        var localSet =
            localCardSets.firstWhere((set) => set.workshopId == workshopSet.id);
        await _updateCardSet(localSet: localSet, workshopSet: workshopSet);
        localCardSets.remove(localSet);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> _updateCardSet({
    required CardSetEntity localSet,
    required CardSetDto workshopSet,
  }) async {
    // update parameter on cardSet
    final cardSet = localSet.copyWith(
      category: workshopSet.category,
      name: workshopSet.name,
      description: workshopSet.description,
      version: workshopSet.version as int,
    );
    updateCardSet(cardSet);

    // load local cardSet cards
    final localCards = await getCardsWithRelatives(localSet.id!);
    final workshopCards = workshopSet.cards;

    _updateCards(localCards, workshopCards?.toList() ?? [],
        cardSetId: cardSet.id!);
  }

  static Future<void> _updateCards(
      List<CardEntity> localCards, List<CardDto> workshopCards,
      {required int cardSetId}) async {
    await deleteCardsByCardSetId(cardSetId);

    final mappedCards = workshopCards
        .map((card) => CardEntity.fromCardDto(card, cardSetId).copyWith(
            active: localCards.every((local) => local.workshopId == card.id)
                ? localCards
                    .firstWhere((local) => local.workshopId == card.id)
                    .active
                : true))
        .toList();
    insertCardList(mappedCards);
  }
}
