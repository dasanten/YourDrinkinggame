import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'dto/card_dto.dart';
import 'dto/card_set_dto.dart';
import 'util/http_util.dart'  as http_util;

// ignore: avoid_classes_with_only_static_members


Future<List<CardSetDto>> getTopCardSets() async {
  final response = await http.get(Uri.https(http_util.backendIp, "/getTopCardSets"));
  if (response.statusCode == 200) {
    return http_util.parseCardSets(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to load to CardSets');
  }
}



Future<CardSetDto> addCardSet(CardSetDto cardSetDto) async {
  final response = await http.post(
      Uri.https(http_util.backendIp, "addCardSet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cardSetDto.toJson()),
  );
  if(response.statusCode == 200) {
    return CardSetDto.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to add CardSet');
  }
}

Future<CardSetDto> editCardSet(CardSetDto cardSetDto, String token) async {
  final response = await http.put(
      Uri.https(http_util.backendIp, "editCardSet", {'token': token}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cardSetDto.toJson()),
  );
  if(response.statusCode == 200) {
    return CardSetDto.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to add CardSet');
  }
}

Future addCards(List<CardDto> cardList, String token) async {
  final response = await http.post(
      Uri.https(http_util.backendIp, "addCards", {'token': token}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(http_util.parseCardList(cardList)),
  );
  if(response.statusCode == 200) {

  } else {
    throw Exception('Failed to add cards');
  }
}

Future<List<CardDto>> updateCards(List<CardDto> cardList, String token) async {
  final response = await http.put(
      Uri.https(http_util.backendIp, "editCards", {'token': token}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(http_util.parseCardList(cardList)),
  );
  if(response.statusCode == 200) {
    return http_util.parseCards(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to update cards');
  }
}

Future favorCardSet(String cardSetId) async {
  final response = await http.post(Uri.https(http_util.backendIp, "/favorCardSet", {'cardSetId': cardSetId}));
  if (response.statusCode != 200) {
    throw Exception('Failed to favor CardSet');
  }
}

Future deleteCardSet(String cardSetId, String token) async {
  final response = await http.delete(
      Uri.https(http_util.backendIp, "/deleteCardSet", {'token': token, 'cardSetId': cardSetId}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
  );
  if(response.statusCode == 200) {

  } else {
    throw Exception('Failed to delete cardSet');
  }
}


