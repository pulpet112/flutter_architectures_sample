import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/personaldata/form_input_data.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_notifier.dart';
import 'package:flutter_architectures_sample/screen/routes.dart';
import 'package:provider/provider.dart';

class PersonalDataForm extends StatefulWidget {
  _PersonalDataFormState createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();

  final FormInputData inputData = FormInputData('', '', '', '');

  @override
  Widget build(BuildContext context) {
    var personalDataNotifier =
        Provider.of<PersonalDataNotifier>(context, listen: false);

    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () => _onFormChanged(personalDataNotifier),
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.nameLabel),
            validator: (value) => personalDataNotifier.validateEmpty(value),
            onSaved: (value) => inputData.name = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.surnameLabel),
            validator: (value) => personalDataNotifier.validateEmpty(value),
            onSaved: (value) => inputData.surname = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.streetLabel),
            validator: (value) => personalDataNotifier.validateEmpty(value),
            onSaved: (value) => inputData.street = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.phoneLabel),
            validator: (value) => personalDataNotifier.validatePhone(value),
            onSaved: (value) => inputData.phone = value,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: Dimens.paddingDefault,
          ),
          Consumer<PersonalDataNotifier>(
            builder: (context, notifier, child) {
              return RaisedButton(
                child: Text(Strings.addressNext),
                onPressed: notifier.isFormValid
                    ? () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          personalDataNotifier.onFormCorrect(inputData);
                          Navigator.of(context)
                              .pushNamed(Routes.personalDataInfo);
                        }
                      }
                    : null,
                color: Colors.blue,
                disabledColor: Colors.grey,
              );
            },
          )
        ],
      ),
    );
  }

  void _onFormChanged(PersonalDataNotifier personalDataNotifier) {
    var isValid = _formKey.currentState == null
        ? false
        : _formKey.currentState.validate();
    personalDataNotifier.onFormChanged(isValid);
  }
}
