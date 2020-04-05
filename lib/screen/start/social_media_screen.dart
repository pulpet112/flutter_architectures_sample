import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/list/social_media_list_screen.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';

class SocialMediaScreen extends StatefulWidget {
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
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
      body: SocialMediaListScreen(),
    );
  }
}
