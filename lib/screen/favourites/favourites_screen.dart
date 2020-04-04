import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/bloc/favourites_list_bloc.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocProvider(
          create: (context) => FavouritesListBloc(
              mainBloc: BlocProvider.of<SocialMediaBloc>(context)),
          child: FavouritesListScreen()),
    );
  }
}
