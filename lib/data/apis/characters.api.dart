import 'package:dio/dio.dart';
import 'package:tut_bloc_omar/constants/strings.dart';
import 'package:tut_bloc_omar/data/models/character.model.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 50), //60 sec
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data);
      return (response.data['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
