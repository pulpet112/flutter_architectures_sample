import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/socialmedia/SimpleSocialMediaRepository.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_screen.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_notifier.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_screen.dart';
import 'package:flutter_architectures_sample/screen/personaldatainfo/personal_data_info_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:flutter_architectures_sample/screen/start/social_media_screen.dart';
import 'package:flutter_architectures_sample/screen/start/start_screen.dart';
import 'package:provider/provider.dart';
import 'model/socialmedia/social_media_model.dart';

void main() {
  runApp(ArchitecturesSampleApp(repository: SimpleSocialMediaRepository()));
}

class ArchitecturesSampleApp extends StatelessWidget {
  final SimpleSocialMediaRepository repository;

  ArchitecturesSampleApp({Key key, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SocialMediaModel>(
          create: (context) => SocialMediaModel(repository),
        ),
        ChangeNotifierProvider<PersonalDataNotifier>(
          create: (context) => PersonalDataNotifier(),
        )
      ],
      child: MaterialApp(
        title: Strings.architecturesSampleApp,
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
        routes: <String, WidgetBuilder>{
          Routes.socialMedia: (context) => SocialMediaScreen(),
          Routes.favourites: (context) => FavouritesScreen(),
          Routes.personalDataForm: (context) => PersonalDataScreen(),
          Routes.personalDataInfo: (context) => PersonalDataInfoScreen()
        },
      ),
    );
  }
}
