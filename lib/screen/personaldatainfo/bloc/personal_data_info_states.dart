import 'package:flutter_architectures_sample/model/personaldata/personal_data.dart';

abstract class PersonalDataInfoState {}

class InfoEmpty extends PersonalDataInfoState {}

class InfoLoaded extends PersonalDataInfoState {
  final PersonalData info;

  InfoLoaded(this.info);
}