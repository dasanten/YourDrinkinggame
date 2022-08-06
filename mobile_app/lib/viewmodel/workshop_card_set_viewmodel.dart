import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/repository/card_Set_repository.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';

import 'async_viewmodel_base.dart';

class WorkshopCardSetViewmodel extends AsyncViewmodelBase {

  late List<CardSetBasicDto> _cardSetList;
  late Map<String, bool> _cardSetLocal;

  bool _isLoadingMore = false;
  bool _loadEverything = false;

  var _error;

  get isLoadingMore => _isLoadingMore;
  get loadEverything => _loadEverything;

  bool get hasError => _error != null;

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
    _loadEverything = false;
    try {
      await api.getCardsetApi().getTopCardSets(start: 0).then((value) => _cardSetList = List.from(value.data?.asList() ?? []) );
      _cardSetLocal.clear();
      setFinished();
      for (final cardSet in _cardSetList) {
        _cardSetLocal[cardSet.id!] =
            await containsCardSet(cardSet.id!);
      }
      _error = null;
      notifyListeners();
    } catch (e) { 
      _error = e;
      print(e);
      notifyListeners();
    }
  }



  void refreshCardSetLocalById(String id, {required bool isLocal}) {
    _cardSetLocal[id] = isLocal;
    notifyListeners();
  }

  void getMoreCardSets(BuildContext context) async	{    
    if(!isLoadingMore && !loadEverything) {
      _isLoadingMore = true;
      notifyListeners();
      var lengthBefore = cardSetList.length;
      await api.getCardsetApi().getTopCardSets(start: cardSetList.length).then((value) => cardSetList.addAll(value.data?.asList() ?? []));
      _isLoadingMore = false;
      if(lengthBefore == cardSetList.length ) {
        ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text("Alle Sets geladen")
            )
          );
        _loadEverything = true;
      } 
      notifyListeners();
    }
  }
}
