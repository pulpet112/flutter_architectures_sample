import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_list_screen.dart';

class FavouritesScreen extends StatefulWidget {
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.favouritesSocialMediaTitle),
      ),
      body: FavouritesListScreen(),
    );
  }
}
