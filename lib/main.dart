import 'package:flutter/material.dart';
import 'package:flutter_state_management_bloc/person_bloc.dart';
import 'package:flutter_state_management_bloc/person_bloc_provider.dart';
import 'package:flutter_state_management_bloc/person_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bloc State Management',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PersonBlocProvider(
          personBloc: PersonBloc(),
          child: MyHomePage(title: 'Bloc State Management')
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 4;
  final String title ;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    final personBloc = PersonBlocProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(title),
      ),
      body: StreamBuilder(
        stream: personBloc.personList,
        builder: (BuildContext contex, snapData){
          if(!snapData.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return mainBody(snapData.data);
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:()=> _addNewPerson(context),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget mainBody(List<Person> snapData) {
    return Column(
      children: <Widget>[
        new Expanded(
            child:  new ListView.builder(
              itemCount: snapData.length,
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: ListTile(
                    title: Text("${snapData[index].name}"),
                    subtitle: Text("${snapData[index].surName}"),
                  ),
                );
              },
            )
        ),
      ],
    );
  }

  void _addNewPerson(BuildContext context) {
    final personBloc = PersonBlocProvider.of(context);
    Person person = Person(name: "Binay $_counter",surName: "Thapa Magar");
    personBloc.addPersonContrller.add(person);
    _counter++;
  }
}
