import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'Dto/CardSetDto.dart';


class CardSetService{

  static Future<List<CardSetDto>> getTopCardSets() async {
    final response = await http.get("http://dasanten.de:8080/getTopCardSets");
    List<Map<String, dynamic>> body;
    if(response.statusCode == 200) {
      body = jsonDecode(response.body) as List<Map<String, dynamic>>;
      return body.map((e) => CardSetDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load to CardSets');
    }
  }

}