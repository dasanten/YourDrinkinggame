import 'package:dio/dio.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';

DrinkinggameApi api = DrinkinggameApi(
    dio: Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/", headers: _headers)));

Map<String, dynamic> get _headers => authToken != null
    ? {
        "Authorization": "Bearer $authToken",
      }
    : {};

String? _authToken;

String? get authToken => _authToken;

void updateAuthToken(String? authToken) {
  _authToken = authToken;
  api.dio.options.headers = _headers;
}
