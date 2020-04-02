import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/social_media_model.dart';
import 'package:flutter_architectures_sample/screen/list/checkbox_social_media_item.dart';
import 'package:provider/provider.dart';

class SocialMediaListScreen extends StatelessWidget {
  SocialMediaListScreen();

  @override
  Widget build(BuildContext context) {
    var socialMedia = Provider.of<SocialMediaModel>(context, listen: false);

    return ListView(
      children: socialMedia.all
          .map((item) => CheckboxSocialMediaItem(item: item))
          .toList(),
    );
  }
}
