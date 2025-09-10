//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_bloc_omar/bussiness/cubit/characters.cubit.dart';
import 'package:tut_bloc_omar/constants/my_colors.dart';
import 'package:tut_bloc_omar/data/models/character.model.dart';

import '../widgets/Character.item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {

  late List<Character> allCharacters;
  late List<Character> searchOnAcharacter;
  bool isSearch = false;
  final _serchTextController = TextEditingController();

  Widget _buildSearchFeild() {
    return TextField(
      controller: _serchTextController,
      cursorColor: MyColors.darkSpace,
      decoration: InputDecoration(
        hintText: 'find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.darkSpace, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.darkSpace, fontSize: 18),
      onChanged: (serchedCharacter) {
        addSearchOnAcharactertoCharacterList(serchedCharacter);
      },
    );
  }

  //search filter
  void addSearchOnAcharactertoCharacterList(String serchedCharacter) {
    searchOnAcharacter = allCharacters
        .where(
          (character) =>
              character.name!.toLowerCase().startsWith(serchedCharacter),
        )
        .toList();
    //adaptation
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context); // dismiss screen
          },
          icon: Icon(Icons.clear, color: MyColors.darkSpace),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: MyColors.darkSpace),
        ),
      ];
    }
  }

  void _startSearch(){
    //search trick !!!!
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
      setState(() {
        isSearch = true ;
      });
  }

  void _stopSearch(){
    _clearSearch();
    setState(() {
      isSearch =false;
    });
  }

   void _clearSearch(){
    setState(() {
      _serchTextController.clear();
    });

   }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget listOfCharacters() {
    return GridView.builder(
      shrinkWrap: true,
      // allows grid to take only needed height
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount:_serchTextController.text.isEmpty?  allCharacters.length : searchOnAcharacter.length,
      itemBuilder: (ctx, index) {

        return CharacterItem(character:_serchTextController.text.isEmpty? allCharacters[index]: searchOnAcharacter[index] );
      },
    );
  }

  Widget buildLoadedcharactres() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.rickWhite,
        child: Column(children: [listOfCharacters()]),
      ),
    );
  }

  Widget CircleLoading() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.mortyYellow),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedcharactres();
        } else {
          return CircleLoading();
        }
      },
    );
  }

Widget _buildAppbarTitle(){
    return Text('Characters', style: TextStyle(color: MyColors.darkSpace,),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mortyYellow,
        title: isSearch? _buildSearchFeild() : _buildAppbarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
