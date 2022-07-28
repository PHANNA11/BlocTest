part of 'data_bloc.dart';

@immutable
abstract class DataState {
  List<Person> list;
  DataState({required this.list});
}

class DataInitial extends DataState {
  DataInitial() : super(list: []);
}

class DataLoaded extends DataState {
  DataLoaded({required List<Person> list}) : super(list: list);
}
