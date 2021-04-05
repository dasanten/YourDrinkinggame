import 'package:flutter/foundation.dart';

import '../HttpService/CardSetService.dart';
import '../HttpService/Dto/CardSetDto.dart';
import '../dataBase/CardSetDB.dart';
import 'async_viewmodel_base.dart';

class WorkshopCardSetViewmodel extends AsyncViewmodelBase {
  List<CardSetDto> _cardSetList;
  Map<String, bool> _cardSetLocal;

  List<CardSetDto> get cardSetList => _cardSetList;
  bool getCardSetLocalById(String id) =>
      _cardSetLocal.containsKey(id) && _cardSetLocal[id];

  WorkshopCardSetViewmodel() {
    _cardSetList = <CardSetDto>[];
    _cardSetLocal = <String, bool>{};
    getWorkshopCardSets();
  }

  Future<void> getWorkshopCardSets() async {
    setLoading();
    _cardSetList = await CardSetService.getTopCardSets();
    _cardSetLocal.clear();
    setFinished();
    for (final cardSet in _cardSetList) {
      _cardSetLocal[cardSet.id] =
          await CardSetDB.cardSetDB.containsCardSet(cardSet.id);
    }
    notifyListeners();
  }

  void refreshCardSetLocalById(String id, {@required bool isLocal}) {
    _cardSetLocal[id] = isLocal;
    notifyListeners();
  }
}
