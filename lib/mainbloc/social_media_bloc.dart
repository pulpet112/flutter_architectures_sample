import 'package:flutter_architectures_sample/mainbloc/social_media_events.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_states.dart';
import 'package:flutter_architectures_sample/model/SimpleSocialMediaRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  final SimpleSocialMediaRepository repository;

  SocialMediaBloc(this.repository);

  @override
  SocialMediaState get initialState => ListPresented(repository.getSocialMedia);

  @override
  Stream<SocialMediaState> mapEventToState(SocialMediaEvent event) async* {
    if (event is CheckboxChecked) {
      yield _mapCheckboxCheckedToState(event);
    }
  }

  SocialMediaState _mapCheckboxCheckedToState(CheckboxChecked event) {
    final updatedList = (state as ListPresented).list;
    updatedList
        .firstWhere((item) => item.id == event.itemId)
        .setFavourite(event.isChecked);
    return ListPresented(updatedList);
  }
}
