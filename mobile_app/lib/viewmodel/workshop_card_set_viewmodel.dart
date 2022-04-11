import 'package:drinkinggame_api/drinkinggame_api.dart';

import '../data_base/card_set_db.dart';

import 'async_viewmodel_base.dart';

class WorkshopCardSetViewmodel extends AsyncViewmodelBase {
  late List<CardSetDto> _cardSetList;
  late Map<String, bool> _cardSetLocal;

  List<CardSetDto> get cardSetList => _cardSetList;
  bool getCardSetLocalById(String id) =>
      _cardSetLocal.containsKey(id) && _cardSetLocal[id]!;

  WorkshopCardSetViewmodel() {
    _cardSetList = <CardSetDto>[];
    _cardSetLocal = <String, bool>{};
    getWorkshopCardSets();
  }

  Future<void> getWorkshopCardSets() async {
    setLoading();
    // _cardSetList = await card_set_http.getTopCardSets();
    // TODO get Cardsets
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
}
