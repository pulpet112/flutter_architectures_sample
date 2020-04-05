import 'package:flutter_architectures_sample/model/personaldata/personal_data.dart';

abstract class PersonalDataEvent {}

class FormInputChanged extends PersonalDataEvent {
  final bool isValid;
  FormInputChanged(this.isValid);
}

class FormCorrect extends PersonalDataEvent {
  final PersonalData formData;

  FormCorrect(this.formData);
}