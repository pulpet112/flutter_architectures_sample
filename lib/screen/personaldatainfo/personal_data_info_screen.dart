import 'package:flutter/material.dart';
import 'package:flutter_architectures_sample/resources/dimens.dart';
import 'package:flutter_architectures_sample/resources/strings.dart';
import 'package:flutter_architectures_sample/screen/personaldata/personal_data_notifier.dart';
import 'package:provider/provider.dart';

class PersonalDataInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<PersonalDataNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.personalDataInfoTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.all(Dimens.paddingDefault),
          child: Column(
            children: <Widget>[
              _getInfoEntry(data.currentUserData.name),
              _getInfoEntry(data.currentUserData.surname),
              _getInfoEntry(data.currentUserData.street),
              _getInfoEntry(data.currentUserData.phone),
            ],
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
