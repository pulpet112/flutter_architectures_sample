import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/socialmedia/SimpleSocialMediaRepository.dart';
import 'package:flutter_architectures_sample/model/socialmedia/social_media.dart';

class SocialMediaModel extends ChangeNotifier {
  final SimpleSocialMediaRepository _repository;

  List<SocialMedia> _socialMedia;

  SocialMediaModel(this._repository) {
    _socialMedia = _repository.getSocialMedia;
  }

  UnmodifiableListView<SocialMedia> get favourites {
    return UnmodifiableListView(_socialMedia.where((item) => item.isFavourite));
  }

  UnmodifiableListView<SocialMedia> get all {
    return UnmodifiableListView(_socialMedia);
  }

  void setFavourite(int itemId, bool isChecked) {
    _socialMedia
        .firstWhere((item) => item.id == itemId)
        .setFavourite(isChecked);
    notifyListeners();
  }
}
