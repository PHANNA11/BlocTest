import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/data_bloc.dart';
import 'package:simple_bloc/models/person_model.dart';
import 'package:simple_bloc/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataBloc blocs;

  @override
  void initState() {
    super.initState();
    blocs = DataBloc();
    blocs.add(DataLoadedEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    blocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<DataBloc, DataState>(
          bloc: blocs,
          builder: (context, state) {
            if (state is DataInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DataLoaded) {
              var personDataList = state.list;
              return ListView.builder(
                itemCount: personDataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(personDataList[index].name),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              blocs.add(AddDataEvent(person: Person(name: 'Phanna')));
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider(
                create: (context) => DataBloc(),
                child: const SecondPage(),
                lazy: false,
              );
            },
            child: const Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}
