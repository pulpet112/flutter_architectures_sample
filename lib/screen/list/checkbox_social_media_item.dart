import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/social_media.dart';
import 'package:flutter_architectures_sample/model/social_media_model.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/widget/social_media_item.dart';
import 'package:provider/provider.dart';

class CheckboxSocialMediaItem extends StatelessWidget {
  final SocialMedia item;

  CheckboxSocialMediaItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingDefault),
      child: Row(
        children: [
          Consumer<SocialMediaModel>(
            builder: (context, model, child) {
              return Checkbox(
                value: item.isFavourite,
                onChanged: (isChecked) =>
                    model.setFavourite(item.id, isChecked),
              );
            },
          ),
          SocialMediaItem(
            item: item,
          )
        ],
      ),
    );
  }
}
