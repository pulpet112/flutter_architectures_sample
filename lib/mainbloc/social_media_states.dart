import 'package:flutter_architectures_sample/model/social_media.dart';

abstract class SocialMediaState {}

class ListPresented extends SocialMediaState {
  final List<SocialMedia> list;

  ListPresented(this.list);
}
