import 'package:flutter_architectures_sample/model/social_media.dart';

abstract class SocialMediaListEvent {}

class ScreenStart extends SocialMediaListEvent {
  final List<SocialMedia> list;

  ScreenStart(this.list);
}
