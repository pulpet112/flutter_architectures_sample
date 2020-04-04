import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/model/SimpleSocialMediaRepository.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:flutter_architectures_sample/screen/start/start_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(BlocProvider(
    create: (context) {
      return SocialMediaBloc(SimpleSocialMediaRepository());
    },
    child: ArchitecturesSampleApp()));

class ArchitecturesSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.architecturesSampleApp,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      routes: <String, WidgetBuilder>{
        Routes.favourites: (context) => FavouritesScreen()
      },
    );
  }
}