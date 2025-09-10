import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatefulWidget {
  const CharactersDetailsScreen({super.key });

  @override
  State<CharactersDetailsScreen> createState() => _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      //body:

    );
  }
}
