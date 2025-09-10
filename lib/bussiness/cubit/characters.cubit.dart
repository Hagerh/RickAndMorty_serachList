import 'package:bloc/bloc.dart';
import'package:meta/meta.dart';
import 'package:tut_bloc_omar/data/apis/characters.api.dart';
import 'package:tut_bloc_omar/data/repository/characters.repository.dart';

import '../../data/models/character.model.dart';

part'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
 List<Character> characters =[];

  CharactersCubit(this.charactersRepository) : super (CharactersInitial());


  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

}

