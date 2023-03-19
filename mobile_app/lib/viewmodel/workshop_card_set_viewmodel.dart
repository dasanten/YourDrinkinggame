import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/repository/card_Set_repository.dart';

import '../openapi/api_client.dart';
import 'async_view_model_base.dart';

class WorkshopCardSetViewModel extends AsyncViewModelBase {
  List<CardSetBasicDto> _cardSetList = [];
  late Map<String, bool> _cardSetLocal;
  String? _searchQuery;
  bool _isLoadingMore = false;
  bool _loadEverything = false;

  var _error;

  get isLoadingMore => _isLoadingMore;

  get loadEverything => _loadEverything;

  bool get hasError => _error != null;

  String? get searchQuery => _searchQuery;

  List<CardSetBasicDto> get cardSetList => _cardSetList;

  bool getCardSetLocalById(String id) =>
      _cardSetLocal.containsKey(id) && _cardSetLocal[id]!;

  WorkshopCardSetViewModel() {
    _cardSetList = <CardSetBasicDto>[];
    _cardSetLocal = <String, bool>{};
    getWorkshopCardSets();
  }

  Future<void> getWorkshopCardSets() async {
    setLoading();
    _loadEverything = false;
    try {
      await api
          .getCardsetApi()
          .getTopCardSets(start: cardSetList.length)
          .then((value) => _cardSetList.addAll(value.data ?? []));
      _cardSetLocal.clear();
      setFinished();
      for (final cardSet in _cardSetList) {
        _cardSetLocal[cardSet.id!] = await containsCardSet(cardSet.id!);
      }
      _error = null;
      notifyListeners();
    } catch (e) {
      _error = e;
      print(e);
      notifyListeners();
    }
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _searchQuery = null;
      getWorkshopCardSets();
      return;
    }
    _searchQuery = query;
    try {
      setLoading();
      _cardSetList = [];
      await api
          .getCardsetApi()
          .searchCardSets(query: query, start: cardSetList.length)
          .then((value) => _cardSetList.addAll(value.data ?? []));
      _error = null;
      setFinished();
    } catch (e) {
      _error = e;
    }
  }

  Future<void> refresh() async {
    _cardSetList = [];
    if (_searchQuery?.isNotEmpty ?? false) {
      search(_searchQuery!);
    } else {
      getWorkshopCardSets();
    }
  }

  void refreshCardSetLocalById(String id, {required bool isLocal}) {
    _cardSetLocal[id] = isLocal;
    notifyListeners();
  }

  void getMoreCardSets(BuildContext context) async {
    if (!isLoadingMore && !loadEverything) {
      _isLoadingMore = true;
      notifyListeners();
      var lengthBefore = cardSetList.length;
      if (searchQuery?.isNotEmpty ?? false) {
        await search(_searchQuery!);
      } else {
        getCardSets();
      }
      _isLoadingMore = false;
      if (lengthBefore == cardSetList.length) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Alle Sets geladen")));
        _loadEverything = true;
      }
      notifyListeners();
    }
  }
}
