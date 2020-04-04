import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/favourites/bloc/favourites_list_bloc.dart';
import 'package:flutter_architectures_sample/screen/favourites/bloc/favourites_list_states.dart';
import 'package:flutter_architectures_sample/widget/social_media_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesListScreen extends StatefulWidget {
  _FavouritesListState createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesListBloc, FavouritesListSate>(
      builder: (context, state) {
        if (state is FavouritesListLoaded) {
          return ListView(
            children: state.favourites
                .map((item) => Padding(
                    padding: const EdgeInsets.all(Dimens.paddingDefault),
                    child: SocialMediaItem(item: item)))
                .toList(),
          );
        } else {
          return Center(
            child: Text(Strings.emptyList),
          );
        }
      },
    );
  }
}
