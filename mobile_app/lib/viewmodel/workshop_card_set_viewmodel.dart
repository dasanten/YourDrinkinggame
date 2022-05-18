import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';

import '../data_base/card_set_db.dart';

import 'async_viewmodel_base.dart';

class WorkshopCardSetViewmodel extends AsyncViewmodelBase {

  late List<CardSetBasicDto> _cardSetList;
  late Map<String, bool> _cardSetLocal;

  bool _isLoadingMore = false;
  bool _loadEverything = false;

  get isLoadingMore => _isLoadingMore;
  get loadEverything => _loadEverything;

  List<CardSetBasicDto> get cardSetList => _cardSetList;
  bool getCardSetLocalById(String id) =>
      _cardSetLocal.containsKey(id) && _cardSetLocal[id]!;

  WorkshopCardSetViewmodel() {
    _cardSetList = <CardSetBasicDto>[];
    _cardSetLocal = <String, bool>{};
    getWorkshopCardSets();
  }

  Future<void> getWorkshopCardSets() async {
    setLoading();
    await cardsetApi.getTopCardSets(start: 0).then((value) => _cardSetList = List.from(value.data?.asList() ?? []) );
    _cardSetLocal.clear();
    setFinished();
    for (final cardSet in _cardSetList) {
      _cardSetLocal[cardSet.id!] =
          await CardSetDB.cardSetDB.containsCardSet(cardSet.id!);
    }
    notifyListeners();
  }

  void refreshCardSetLocalById(String id, {required bool isLocal}) {
    _cardSetLocal[id] = isLocal;
    notifyListeners();
  }

  void getMoreCardSets() async	{
    if(!_loadEverything && !isLoadingMore) {
      _isLoadingMore = true;
      var lengthBefore = cardSetList.length;
      await cardsetApi.getTopCardSets(start: cardSetList.length).then((value) => cardSetList.addAll(value.data?.asList() ?? []));
      _isLoadingMore = false;
      if(lengthBefore == cardSetList.length ) {
        _loadEverything = true;
      } else {
        notifyListeners();
      }
    }
  }
}
