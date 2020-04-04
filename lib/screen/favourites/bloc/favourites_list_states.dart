import 'package:flutter_architectures_sample/model/social_media.dart';

abstract class FavouritesListSate {}

class FavouritesListEmpty extends FavouritesListSate {}

class FavouritesListLoaded extends FavouritesListSate {
  final List<SocialMedia> favourites;

  FavouritesListLoaded(this.favourites);
}