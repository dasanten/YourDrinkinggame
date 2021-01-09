import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'Dto/CardSetDto.dart';

class CardSetService {
  static Future<List<CardSetDto>> getTopCardSets() async {
    // final response = await http.get("localhost:8080/getTopCardSets");
    final response =
        await http.get(Uri.http("192.168.236.81:8080", "/getTopCardSets"));

    if (response.statusCode == 200) {
      return parseCardSets(response.body);
    } else {
      throw Exception('Failed to load to CardSets');
    }
  }

  static List<CardSetDto> parseCardSets(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardSetDto>((json) => CardSetDto.fromJson(json)).toList();
  }
}
