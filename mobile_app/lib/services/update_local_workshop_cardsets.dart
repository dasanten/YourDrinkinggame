
import '../data_base/card_set_db.dart';
import '../data_base/models/card_entity.dart';
import '../data_base/models/card_set_entity.dart';
import '../http_service/dto/card_dto.dart';
import '../http_service/dto/card_set_dto.dart';
import '../http_service/dto/card_set_version_dto.dart';
import '../http_service/update_service.dart' as UpdateHttpService;

List<CardSetEntity> _localCardSets = [];
List<CardSetDto> _workshopCardSets = [];
List<CardEntity> _removeCards = [];  

Future checkForUpdatedCardSets() async {

  _workshopCardSets = await _getNewCardSetsFromWorkshop();
  _localCardSets = await CardSetDB.cardSetDB.getCardSets();

  _compareCardSets();
}

Future _compareCardSets() async {

  for (final newCardSet in _workshopCardSets) {
    final CardSetEntity updatedCardSet = _updateCardSet(newCardSet);

    // List of old Local Cards
    final List<CardEntity> localCards = await CardSetDB.cardSetDB.getCards(updatedCardSet.id!);

    _removeCards = List.from(localCards);

    _compareCards(newCardSet.cardList, localCards, updatedCardSet);
  }
}

Future<List<CardSetVersionDto>> _mapToCardSetVersionList() async {
  _localCardSets.removeWhere((element) => element.workshopId?.isEmpty ?? true);
  return _localCardSets.map<CardSetVersionDto>((e) => CardSetVersionDto.fromCardEntity(e)).toList();
  
}

Future _compareCards(List<CardDto> workshopCards, List<CardEntity> localCards, CardSetEntity updatedCardSet) async {
    for (final newCard in workshopCards) {
      bool updated = false;
      for (final CardEntity dbCard in localCards) {
        updated = _updateCard(dbCard, newCard);
        if (updated) break;
      }
      if(!updated) {
        CardSetDB.cardSetDB.insertCard(CardEntity.fromCardDto(newCard, updatedCardSet.id!));
      }
    }
    for (final card in _removeCards) { CardSetDB.cardSetDB.deleteCard(card.id!); }    
}

Future<List<CardSetDto>> _getNewCardSetsFromWorkshop() async => UpdateHttpService.checkCardSetUpdates(await _mapToCardSetVersionList());


CardSetEntity _updateCardSet(CardSetDto newWorkshopCardSet) {
  // Find correspondig saved CardSet and copy with changes
  final CardSetEntity cardSet = _localCardSets.firstWhere((element) => element.workshopId==newWorkshopCardSet.id).copyWith(name: newWorkshopCardSet.name, description: newWorkshopCardSet.description, version: newWorkshopCardSet.version);

  // Save changed CardSet
  CardSetDB.cardSetDB.updateCardSet(cardSet);
  return cardSet;
}

bool _updateCard(CardEntity localCard, CardDto workshopCard) {
  if(localCard.workshopId == workshopCard.id) {
    _removeCards.remove(localCard);
    CardSetDB.cardSetDB.updateCard(localCard.copyWith(content: workshopCard.content));
    return true;
  } 
  return false;
}