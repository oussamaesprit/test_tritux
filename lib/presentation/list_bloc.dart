import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tritux/data/list_repository.dart';
import 'package:flutter_tritux/domain/list.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository listRepository;

  ListBloc({required this.listRepository}) : super(ListInitial());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is FetchList) {
      yield ListLoading();

      try {
        List<Listt> list = await listRepository.fetchList();
        yield ListLoaded(list: list);
      } catch (error) {
        yield ListError(error: error.toString());
      }
    }
  }
}