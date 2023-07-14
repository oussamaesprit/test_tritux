import 'package:flutter_tritux/domain/list.dart';

abstract class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
    final List<Listt> list;

  ListLoaded({required this.list});
}

class ListError extends ListState {
  final String error;

  ListError({required this.error});
}