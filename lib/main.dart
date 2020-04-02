import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/SimpleSocialMediaRepository.dart';
import 'package:flutter_architectures_sample/model/social_media_model.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:flutter_architectures_sample/screen/start/start_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ArchitecturesSampleApp(repository: SimpleSocialMediaRepository()));
}

class ArchitecturesSampleApp extends StatelessWidget {
  final SimpleSocialMediaRepository repository;

  ArchitecturesSampleApp({Key key, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SocialMediaModel(repository),
      child: MaterialApp(
        title: Strings.architecturesSampleApp,
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
        routes: <String, WidgetBuilder>{
          Routes.favourites: (context) => FavouritesScreen()
        },
      ),
    );
  }
}
