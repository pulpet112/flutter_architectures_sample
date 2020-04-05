import 'package:flutter/material.dart';

class SocialMedia {
  int id;
  String title;
  String iconAsset;
  bool isFavourite;

  SocialMedia(
      {@required this.id,
      @required this.title,
      @required this.iconAsset,
      this.isFavourite = false});

  void setFavourite(bool isFavourite) {
    this.isFavourite = isFavourite;
  }
}
