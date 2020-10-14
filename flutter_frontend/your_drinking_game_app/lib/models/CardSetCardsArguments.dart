import '../HttpService/Dto/CardDto.dart';
import '../HttpService/Dto/CardSetDto.dart';

class CardSetCardsArguments {

  CardSetDto cardSet;
  List<CardDto> cardList;

  CardSetCardsArguments(this.cardSet, this.cardList);
}