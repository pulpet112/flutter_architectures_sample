import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_events.dart';
import 'package:flutter_architectures_sample/screen/personaldata/bloc/personal_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  @override
  PersonalDataState get initialState => NextButtonDisabled();

  @override
  Stream<PersonalDataState> mapEventToState(PersonalDataEvent event) async* {
    if (event is FormCorrect) {
      yield InputFormCorrect(event.formData);
    } else if (event is FormInputChanged) {
      yield mapFormInputChangedToState(event);
    }
  }

  PersonalDataState mapFormInputChangedToState(FormInputChanged event) {
    if (event.isValid) {
      return NextButtonEnabled();
    } else {
      return NextButtonDisabled();
    }
  }
}
