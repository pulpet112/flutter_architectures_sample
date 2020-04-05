import 'package:flutter_architectures_sample/model/personaldata/personal_data.dart';

abstract class PersonalDataState {}

class NextButtonDisabled extends PersonalDataState {}

class NextButtonEnabled extends PersonalDataState {}

class InputFormCorrect extends PersonalDataState {
  final PersonalData model;

  InputFormCorrect(this.model);
}
