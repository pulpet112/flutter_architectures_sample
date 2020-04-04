import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_events.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_bloc.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkbox_social_media_item.dart';

class SocialMediaListScreen extends StatefulWidget {
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaListBloc, SocialMediaListState>(
      builder: (context, state) {
        if (state is MainListLoaded) {
          return ListView(
            children: state.socialMedia
                .map((item) => CheckboxSocialMediaItem(
                      item: item,
                      onCheckboxChanged: (isChecked) =>
                          BlocProvider.of<SocialMediaBloc>(context)
                              .add(CheckboxChecked(isChecked, item.id)),
                    ))
                .toList(),
          );
        } else {
          return Center(child: Text(Strings.emptyList));
        }
      },
    );
  }
}
