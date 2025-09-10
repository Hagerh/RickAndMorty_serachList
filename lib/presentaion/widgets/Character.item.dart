import 'package:flutter/material.dart';
import 'package:tut_bloc_omar/constants/my_colors.dart';

import '../../data/models/character.model.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: MyColors.rickWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.name}',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.rickWhite,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.darkSpace,
          child: (character.image != null && character.image!.isNotEmpty)
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/Loading Dots In Yellow.gif',
                  image: character.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
