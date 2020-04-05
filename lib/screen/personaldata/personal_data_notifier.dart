import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/address/personal_data.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/personaldata/form_input_data.dart';

class PersonalDataNotifier extends ChangeNotifier {
  static const int PHONE_MIN_LENGTH = 9;

  PersonalData _userData;
  bool _isFormValid;

  PersonalDataNotifier() {
    _userData = PersonalData("", "", "", "");
    _isFormValid = false;
  }

  PersonalData get currentUserData => _userData;
  bool get isFormValid => _isFormValid;

  String validateEmpty(String value) {
    if (value.isEmpty) {
      return Strings.emptyErrorMessage;
    }
    return null;
  }

  String validatePhone(String value) {
    if (value.isEmpty) {
      return Strings.emptyErrorMessage;
    } else if (value.length < PHONE_MIN_LENGTH) {
      return Strings.phoneErrorMessage;
    }
    return null;
  }

  void onFormCorrect(FormInputData inputData) {
    updateData(inputData.name, inputData.surname, inputData.street, inputData.phone);
    notifyListeners();
  }

  void onFormChanged(bool isFormValid) {
    _isFormValid = isFormValid;
    notifyListeners();
  }

  void updateData(String name, String surname, String street, String phone) {
    _userData.name = name;
    _userData.surname = surname;
    _userData.street = street;
    _userData.phone = phone;
  }
}
