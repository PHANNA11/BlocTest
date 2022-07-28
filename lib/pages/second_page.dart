import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/data_bloc.dart';
import 'package:simple_bloc/models/person_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late DataBloc bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = DataBloc();
    bloc.add(DataLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<DataBloc, DataState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is DataInitial) {
              return const CircularProgressIndicator();
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
              bloc.add(AddDataEvent(person: Person(name: 'Channa')));
            },
            child: const Icon(Icons.add),
          ),
          // FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const SecondPage(),
          //           ));
          //     });
          //   },
          //   child: const Icon(Icons.forward),
          // ),
        ],
      ),
    );
  }
}
