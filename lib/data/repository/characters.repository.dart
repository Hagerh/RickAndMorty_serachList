import 'package:tut_bloc_omar/data/apis/characters.api.dart';

import '../models/character.model.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<Character>> getAllCharacters() async {
    return await charactersApi.getAllCharacters();
  }
}
