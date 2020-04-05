import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/model/personaldata/personal_data.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../routes.dart';
import 'bloc/personal_data_bloc.dart';
import 'bloc/personal_data_states.dart';

class PersonalDataForm extends StatefulWidget {
  final ValueChanged<PersonalData> onFormCorrect;
  final Function(bool isValid) onChange;

  const PersonalDataForm({Key key, this.onFormCorrect, this.onChange})
      : super(key: key);

  _PersonalDataFormState createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();

  final PersonalData model = PersonalData('', '', '', '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: _onFormChanged,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.nameLabel),
            validator: _validateNotEmpty,
            onSaved: (value) => model.name = value,
          ),
          TextFormField(
              decoration:
                  const InputDecoration(labelText: Strings.surnameLabel),
              validator: _validateNotEmpty,
              onSaved: (value) => model.surname = value),
          TextFormField(
              decoration: const InputDecoration(labelText: Strings.streetLabel),
              validator: _validateNotEmpty,
              onSaved: (value) => model.street = value),
          TextFormField(
            decoration: const InputDecoration(labelText: Strings.phoneLabel),
            validator: _validatePhoneNumber,
            onSaved: (value) => model.phone = value,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: Dimens.paddingDefault,
          ),
          BlocBuilder<PersonalDataBloc, PersonalDataState>(
              builder: (context, state) {
            return RaisedButton(
              child: Text(Strings.addressNext),
              onPressed: state is NextButtonEnabled
                  ? () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.onFormCorrect(model);
                        Navigator.of(context)
                            .pushNamed(Routes.personalDataInfo);
                      }
                    }
                  : null,
              color: Colors.blue,
              disabledColor: Colors.grey,
            );
          })
        ],
      ),
    );
  }

  void _onFormChanged() {
    widget.onChange(_formKey.currentState == null
        ? false
        : _formKey.currentState.validate());
  }

  String _validateNotEmpty(String value) {
    if (value.isEmpty) {
      return Strings.emptyErrorMessage;
    } else {
      return null;
    }
  }

  String _validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return Strings.emptyErrorMessage;
    } else if (value.length < 9) {
      return Strings.phoneErrorMessage;
    } else {
      return null;
    }
  }
}
