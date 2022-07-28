import 'package:simple_bloc/models/person_model.dart';

class PersonRepository {
  final List<Person> list = [];
  List<Person> loadPerson() {
    list.addAll(
        [Person(name: 'name1'), Person(name: 'name2'), Person(name: 'name3')]);
    return list;
  }

  List<Person> addPerson({required Person person}) {
    list.add(person);
    return list;
  }
}
