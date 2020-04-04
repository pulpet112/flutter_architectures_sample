import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/social_media.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/widget/social_media_item.dart';

class CheckboxSocialMediaItem extends StatelessWidget {
  final SocialMedia item;
  final ValueChanged<bool> onCheckboxChanged;

  CheckboxSocialMediaItem(
      {Key key, @required this.item, @required this.onCheckboxChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingDefault),
      child: Row(
        children: [
          Checkbox(value: item.isFavourite, onChanged: onCheckboxChanged),
          SocialMediaItem(
            item: item,
          )
        ],
      ),
    );
  }
}
