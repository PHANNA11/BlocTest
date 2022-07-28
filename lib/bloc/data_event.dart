part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class AddDataEvent extends DataEvent {
  final Person person;
  AddDataEvent({required this.person});
}

class DataLoadedEvent extends DataEvent {}
