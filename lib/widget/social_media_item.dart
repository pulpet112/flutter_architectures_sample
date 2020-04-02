import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/social_media.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaItem extends StatelessWidget {
  final SocialMedia item;

  SocialMediaItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: Dimens.paddingSmall),
            child: SvgPicture.asset(item.iconAsset)),
        Text(item.title),
      ],
    );
  }
}
