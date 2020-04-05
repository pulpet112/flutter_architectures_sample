import 'package:flutter/cupertino.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_bloc.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_states.dart';
import 'package:flutter_architectures_sample/screen/personaldatainfo/bloc/personal_data_info_events.dart';
import 'package:flutter_architectures_sample/screen/personaldatainfo/bloc/personal_data_info_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDataInfoBloc
    extends Bloc<PersonalDataInfoEvent, PersonalDataInfoState> {
  final PersonalDataBloc mainBloc;

  PersonalDataInfoBloc({@required this.mainBloc}) {
    mainBloc.listen((state) {
      if (state is InputFormCorrect) {
        add(PersonalDataInfoScreenStart(state.model));
      }
    });
  }

  @override
  PersonalDataInfoState get initialState => InfoEmpty();

  @override
  Stream<PersonalDataInfoState> mapEventToState(PersonalDataInfoEvent event) async* {
    if (event is PersonalDataInfoScreenStart) {
      yield InfoLoaded(event.model);
    }
  }
}
