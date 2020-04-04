import 'package:flutter/cupertino.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_bloc.dart';
import 'package:flutter_architectures_sample/mainbloc/social_media_states.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_events.dart';
import 'package:flutter_architectures_sample/screen/list/bloc/social_media_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaListBloc
    extends Bloc<SocialMediaListEvent, SocialMediaListState> {
  final SocialMediaBloc mainBloc;

  SocialMediaListBloc({@required this.mainBloc}) {
    mainBloc.listen((state) {
      if (state is ListPresented) {
        add(ScreenStart(state.list));
      }
    });
  }

  @override
  SocialMediaListState get initialState => MainListEmpty();

  @override
  Stream<SocialMediaListState> mapEventToState(
      SocialMediaListEvent event) async* {
    switch (event.runtimeType) {
      case ScreenStart:
        yield MainListLoaded((event as ScreenStart).list);
        break;
    }
  }
}
