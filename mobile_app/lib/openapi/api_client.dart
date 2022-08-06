import 'package:dio/dio.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';

DrinkinggameApi api = DrinkinggameApi(dio: Dio(BaseOptions(baseUrl: "https://dasanten.de:8080/")));