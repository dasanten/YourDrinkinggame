import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'HttpUtil.dart';
import 'dto/CardDto.dart';
import 'dto/CardSetDto.dart';

// ignore: avoid_classes_with_only_static_members
class CardSetService {

  static final String _rooturl = HttpUtil.backendIp;

  static Future<List<CardSetDto>> getTopCardSets() async {
    final response = await http.get(Uri.http(_rooturl, "/getTopCardSets"));
    if (response.statusCode == 200) {
      return parseCardSets(response.body);
    } else {
      throw Exception('Failed to load to CardSets');
    }
  }

  static Future<CardSetDto> addCardSet(CardSetDto cardSetDto) async {
    final response = await http.post(
        Uri.http(_rooturl, "addCardSet"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cardSetDto.toJson()),
    );
    if(response.statusCode == 200) {
      return CardSetDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to add CardSet');
    }
  }

    static Future addCards(List<CardDto> cardList, String token) async {
    final response = await http.post(
        Uri.http(_rooturl, "addCards", {'token': token}),
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

  static List<CardSetDto> parseCardSets(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardSetDto>((json) => CardSetDto.fromJson(json as Map<String, dynamic>)).toList() as List<CardSetDto>;
  }

  static List<Map<String, dynamic>> parseCardList(List<CardDto> cardList) => 
    cardList.map((e) => e.toJson()).toList();
}
