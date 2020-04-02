import 'package:flutter_architectures_sample/model/social_media.dart';
import 'package:flutter_architectures_sample/resources/images.dart';

class SimpleSocialMediaRepository {
  List<SocialMedia> getSocialMedia = [
    SocialMedia(id: 1, title: 'Facebook', iconAsset: Images.facebook),
    SocialMedia(id: 2, title: 'Instagram', iconAsset: Images.instagram),
    SocialMedia(id: 3, title: 'LinkedIn', iconAsset: Images.linkedin),
    SocialMedia(id: 4, title: 'QZone', iconAsset: Images.qzone),
    SocialMedia(id: 5, title: 'Reddit', iconAsset: Images.reddit),
    SocialMedia(id: 6, title: 'Snapchat', iconAsset: Images.snapchat),
    SocialMedia(id: 7, title: 'Youtube', iconAsset: Images.youtube),
    SocialMedia(id: 8, title: 'Twitter', iconAsset: Images.twitter),
  ];
}
