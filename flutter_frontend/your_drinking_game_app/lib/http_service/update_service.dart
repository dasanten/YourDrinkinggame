import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dto/card_set_dto.dart';
import 'dto/card_set_version_dto.dart';
import 'util/http_util.dart' as http_util;


Future<List<CardSetDto>> checkCardSetUpdates(List<CardSetVersionDto> cardSetVersionList) async {
  final response = await http.put(Uri.https(http_util.backendIp, "/checkCardSetUpdates"),
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(cardSetVersionList.map((e) => e.toJson()).toList())
  );
  if (response.statusCode == 200) {
    return http_util.parseCardSets(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to load to CardSets');
  }
}

