import 'dart:convert';

import '../dto/card_dto.dart';
import '../dto/card_set_dto.dart';

String backendIp = "dasanten.de:8080";
  // static String backendIp = "10.0.2.2:8080";

List<CardSetDto> parseCardSets(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<CardSetDto>((json) => CardSetDto.fromJson(json as Map<String, dynamic>)).toList() as List<CardSetDto>;
}

List<Map<String, dynamic>> parseCardList(List<CardDto> cardList) => 
cardList.map((e) => e.toJson()).toList();


List<CardDto> parseCards(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<CardDto>((json) => CardDto.fromJson(json as Map<String, dynamic>)).toList() as List<CardDto>;
}
