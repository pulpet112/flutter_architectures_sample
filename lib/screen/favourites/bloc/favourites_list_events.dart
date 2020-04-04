import 'package:flutter_architectures_sample/model/social_media.dart';

abstract class FavouritesListEvent {}

class FavouritesScreenStart extends FavouritesListEvent {
  final List<SocialMedia> list;

  FavouritesScreenStart(this.list);
}