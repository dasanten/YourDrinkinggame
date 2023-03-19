import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';
import 'package:your_drinking_game_app/viewmodel/async_view_model_base.dart';

class CurrentWorkshopCardSetViewmodel extends AsyncViewModelBase {
  CardSetDto? _cardSet;

  CardSetDto? get cardSet => _cardSet;

  void setCardSet(String cardSetId) async {
    setLoading();
    try {
      _cardSet = (await api.getCardsetApi().getCardSetById(id: cardSetId)).data;
    } catch (e) {
      print("CardSet with id: $cardSetId does not exist");
    }
    setFinished();
  }
}
