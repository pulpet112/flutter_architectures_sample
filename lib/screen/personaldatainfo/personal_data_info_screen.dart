import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_bloc.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDataInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.personalDataInfoTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.all(Dimens.paddingDefault),
          child: BlocBuilder<PersonalDataBloc, PersonalDataState>(
            builder: (context, state) {
              if (state is InputFormCorrect) {
                var info = state.model;
                return Column(
                  children: <Widget>[
                    _getInfoEntry(info.name),
                    _getInfoEntry(info.surname),
                    _getInfoEntry(info.street),
                    _getInfoEntry(info.phone),
                  ],
                );
              } else {
                return Center(
                  child: Text(Strings.emptyList),
                );
              }
            },
          )),
    );
  }

  Widget _getInfoEntry(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.paddingMin),
        child: Text(
          text,
          style: TextStyle(fontSize: Dimens.textSizeBig),
        ),
      ),
    );
  }
}
