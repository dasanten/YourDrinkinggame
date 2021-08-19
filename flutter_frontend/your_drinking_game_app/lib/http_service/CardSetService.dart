import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:your_drinking_game_app/enums/token_auth.dart';

import 'HttpUtil.dart';
import 'dto/CardDto.dart';
import 'dto/CardSetDto.dart';

// ignore: avoid_classes_with_only_static_members
class CardSetService {

  static final String _rooturl = HttpUtil.backendIp;

  static Future<List<CardSetDto>> getTopCardSets() async {
    final response = await http.get(Uri.https(_rooturl, "/getTopCardSets"));
    if (response.statusCode == 200) {
      return parseCardSets(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load to CardSets');
    }
  }

  static Future<TokenAuth> getTokenType(CardSetDto cardSetDto) async {
    final response = await http.post(
      Uri.https(_rooturl, "/checkToken"),        
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cardSetDto.toJson()),
    );
    if (response.statusCode == 200) {
      return TokenAuth.values.firstWhere((element) => element.toString().contains(utf8.decode(response.bodyBytes).replaceAll('"', '')));
    } else {
      throw Exception('Failed to check token');
    }
  }

  static Future<CardSetDto> addCardSet(CardSetDto cardSetDto) async {
    final response = await http.post(
        Uri.https(_rooturl, "addCardSet"),
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

  static Future addCards(List<CardDto> cardList, String token) async {
    final response = await http.post(
        Uri.https(_rooturl, "addCards", {'token': token}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(parseCardList(cardList)),
    );
    if(response.statusCode == 200) {

    } else {
      throw Exception('Failed to add cards');
    }
  }

  static Future favorCardSet(String cardSetId) async {
    final response = await http.post(Uri.https(_rooturl, "/favorCardSet", {'cardSetId': cardSetId}));
    if (response.statusCode != 200) {
      throw Exception('Failed to favor CardSet');
    }
  }

  static Future deleteCardSet(String cardSetId, String token) async {
    final response = await http.delete(
        Uri.https(_rooturl, "/deleteCardSet", {'token': token, 'cardSetId': cardSetId}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    if(response.statusCode == 200) {

    } else {
      throw Exception('Failed to delete cardSet');
    }
  }

  static List<CardSetDto> parseCardSets(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardSetDto>((json) => CardSetDto.fromJson(json as Map<String, dynamic>)).toList() as List<CardSetDto>;
  }

  static List<Map<String, dynamic>> parseCardList(List<CardDto> cardList) => 
    cardList.map((e) => e.toJson()).toList();
}
