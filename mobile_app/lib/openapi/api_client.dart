import 'package:dio/dio.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

DrinkinggameApi api = DrinkinggameApi(dio: Dio(BaseOptions(baseUrl: "https://dasanten.de:8080/", headers: _headers)));

Map<String, dynamic> get _headers => {
  "Authorization": "Bearer $authToken",
};

void updateAuthToken() {
  api.dio.options.headers = _headers;
}