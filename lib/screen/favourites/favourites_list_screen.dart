import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/socialmedia/social_media_model.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/widget/social_media_item.dart';
import 'package:provider/provider.dart';

class FavouritesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<SocialMediaModel>(context, listen: false).favourites;

    return ListView(
      children: list
          .map((item) => Padding(
              padding: const EdgeInsets.all(Dimens.paddingDefault),
              child: SocialMediaItem(item: item)))
          .toList(),
    );
  }
}
