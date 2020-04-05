import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/model/SimpleSocialMediaRepository.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/favourites_screen.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_bloc.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_bloc.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_screen.dart';
import 'package:flutter_architectures_sample/screen/personaldatainfo/bloc/personal_data_info_bloc.dart';
import 'package:flutter_architectures_sample/screen/personaldatainfo/personal_data_info_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:flutter_architectures_sample/screen/start/social_media_screen.dart';
import 'package:flutter_architectures_sample/screen/start/start_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => SocialMediaBloc(SimpleSocialMediaRepository()),
        ),
        BlocProvider(
            create: (context) => SocialMediaListBloc(
                mainBloc: BlocProvider.of<SocialMediaBloc>(context))),
        BlocProvider(
          create: (context) => PersonalDataBloc(),
        ),
        BlocProvider(
          create: (context) => PersonalDataInfoBloc(
              mainBloc: BlocProvider.of<PersonalDataBloc>(context)),
        )
      ], child: ArchitecturesSampleApp()),
    );

class ArchitecturesSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.architecturesSampleApp,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      routes: <String, WidgetBuilder>{
        Routes.socialMedia: (context) => SocialMediaScreen(),
        Routes.favourites: (context) => FavouritesScreen(),
        Routes.personalDataForm: (context) => PersonalDataScreen(),
        Routes.personalDataInfo: (context) => PersonalDataInfoScreen()
      },
    );
  }
}
