import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_bloc.dart';
import 'package:flutter_architectures_sample/screen/list/social_media_list_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreen extends StatefulWidget {
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.socialMediaListTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.favourites);
              },
            )
          ],
        ),
        body: BlocProvider(
            create: (context) => SocialMediaListBloc(
              mainBloc: BlocProvider.of<SocialMediaBloc>(context)
            ),
            child: SocialMediaListScreen()));
  }
}
