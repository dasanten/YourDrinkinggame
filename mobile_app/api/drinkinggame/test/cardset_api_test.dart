import 'package:test/test.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';


/// tests for CardsetApi
void main() {
  final instance = DrinkinggameApi().getCardsetApi();

  group(CardsetApi, () {
    // Adds Cardset with corresponding Cards.
    //
    //Future<CardSetDto> addCardSet(CardSetDto cardSetDto) async
    test('test addCardSet', () async {
      // TODO
    });

    // Adds Cardset with corresponding Cards.
    //
    //Future deleteCardSet(String id) async
    test('test deleteCardSet', () async {
      // TODO
    });

    // Edits Cardset with corresponding Cards.
    //
    //Future<CardSetDto> editCardSet(CardSetDto cardSetDto) async
    test('test editCardSet', () async {
      // TODO
    });

    // Favors Cardset.
    //
    //Future<CardSetBasicDto> favorCardSet(String id) async
    test('test favorCardSet', () async {
      // TODO
    });

    // Returns a Cardset by it's id with cards.
    //
    //Future<CardSetDto> getCardSetById(String id) async
    test('test getCardSetById', () async {
      // TODO
    });

    // Returns a list of 20 Cardsets sorted by likes.
    //
    //Future<BuiltList<CardSetBasicDto>> getTopCardSets(int start) async
    test('test getTopCardSets', () async {
      // TODO
    });

    // Reports Cardset.
    //
    //Future<CardSetBasicDto> reportCardSet(String id) async
    test('test reportCardSet', () async {
      // TODO
    });

    // Returns a list of 20 Cardsets similar to query.
    //
    //Future<BuiltList<CardSetBasicDto>> searchCardSets(String query, int start) async
    test('test searchCardSets', () async {
      // TODO
    });

  });
}
