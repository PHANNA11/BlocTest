import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_bloc/models/person_model.dart';
import 'package:simple_bloc/res/repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final _personRepo = PersonRepository();
  DataBloc() : super(DataInitial()) {
    on<DataEvent>((event, emit) {
      return emit(DataLoaded(list: _personRepo.loadPerson()));
    });
    on<AddDataEvent>(
      (event, emit) {
        return emit(
            DataLoaded(list: _personRepo.addPerson(person: event.person)));
      },
    );
  }
}
