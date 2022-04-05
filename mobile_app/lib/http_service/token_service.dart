import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dto/card_set_dto.dart';
import 'dto/enums/token_auth.dart';
import 'util/http_util.dart'  as http_util;

Future<TokenAuth> getTokenType(CardSetDto cardSetDto) async {
  final response = await http.post(
    Uri.https(http_util.backendIp, "/checkToken"),        
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