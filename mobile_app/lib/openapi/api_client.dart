import 'package:dio/dio.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';

CardsetApi cardsetApi = CardsetApi(Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/")), standardSerializers);