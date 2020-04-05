import 'package:flutter_architectures_sample/model/personaldata/personal_data.dart';

abstract class PersonalDataInfoEvent {}

class PersonalDataInfoScreenStart extends PersonalDataInfoEvent{
  final PersonalData model;

  PersonalDataInfoScreenStart(this.model);
}