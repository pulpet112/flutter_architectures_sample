import 'package:flutter_architectures_sample/model/social_media.dart';

abstract class SocialMediaListState {}

class MainListEmpty extends SocialMediaListState {}

class MainListLoaded extends SocialMediaListState {
  final List<SocialMedia> socialMedia;

  MainListLoaded(this.socialMedia);
}