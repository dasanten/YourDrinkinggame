import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'Dto/CardSetDto.dart';

class CardSetService {

  static Future<List<CardSetDto>> getTopCardSets() async {
    final response = await http.get(Uri.http("10.0.2.2:8080", "/getTopCardSets"));
    if (response.statusCode == 200) {
      return parseCardSets(response.body);
    } else {
      throw Exception('Failed to load to CardSets');
    }
  }

  static Future addCardSet(CardSetDto cardSetDto) async {
    final response = await http.post(
        Uri.http("10.0.2.2:8080", "addCardSet"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cardSetDto.toJson()),
    );
    if(response.statusCode == 200) {

    } else {
      throw Exception('Failed to add CardSet');
    }
    
    
  }

  static List<CardSetDto> parseCardSets(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardSetDto>((json) => CardSetDto.fromJson(json as Map<String, dynamic>)).toList() as List<CardSetDto>;
  }
}
