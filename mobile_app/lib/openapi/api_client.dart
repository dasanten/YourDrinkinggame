import 'package:dio/dio.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';

DrinkinggameApi api = DrinkinggameApi(dio: Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/")));