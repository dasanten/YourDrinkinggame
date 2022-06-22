import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';
import 'package:your_drinking_game_app/viewmodel/async_viewmodel_base.dart';

class CurrentWorkshopCardSetViewmodel extends AsyncViewmodelBase {

  CardSetDto? _cardSet;

  CardSetDto? get cardSet => _cardSet;

  void setCardSet(String cardSetId) async {
    setLoading();
    try {
      _cardSet = (await cardsetApi.getCardSetById(id: cardSetId)).data;
    } catch (e) {
      print("CardSet with id: $cardSetId does not exist");
    }
    setFinished();
  }

}