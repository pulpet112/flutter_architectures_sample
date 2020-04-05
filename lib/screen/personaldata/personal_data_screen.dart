import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_events.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/personal_data_bloc.dart';

class PersonalDataScreen extends StatefulWidget {
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.personalDataFormTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.paddingDefault),
        child: PersonalDataForm(
          onFormCorrect: (data) =>
              BlocProvider.of<PersonalDataBloc>(context).add(FormCorrect(data)),
          onChange: (isValid) =>
              BlocProvider.of<PersonalDataBloc>(context).add(FormInputChanged(isValid)),
        ),
      ),
    );
  }
}
