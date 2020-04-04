import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourites_list_events.dart';
import 'favourites_list_states.dart';

class FavouritesListBloc extends Bloc<FavouritesListEvent, FavouritesListSate> {
  final SocialMediaBloc mainBloc;

  FavouritesListBloc({@required this.mainBloc}) {
    mainBloc.listen((state) {
      if (state is ListPresented) {
        add(FavouritesScreenStart(state.list));
      }
    });
  }

  @override
  FavouritesListSate get initialState => FavouritesListEmpty();

  @override
  Stream<FavouritesListSate> mapEventToState(FavouritesListEvent event) async* {
    if (event is FavouritesScreenStart) {
      var favouritesList = event.list.where((item) => item.isFavourite).toList();
      yield FavouritesListLoaded(favouritesList);
    }
  }
}