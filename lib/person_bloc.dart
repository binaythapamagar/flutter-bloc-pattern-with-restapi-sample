
import 'dart:async';

import 'package:flutter_state_management_bloc/person_model.dart';
import 'package:flutter_state_management_bloc/person_view_model.dart';

class PersonBloc{
  PersonViewModel personViewModel = PersonViewModel();
  final personListController = StreamController<List<Person>>();
  final addPersonContrller = StreamController<Person>();

  Stream<List<Person>> get personList => personListController.stream;
  Sink<Person> get addPerson => addPersonContrller.sink;

  PersonBloc(){
    addPersonContrller.stream.listen(onPersonChanged); //addPersonController keeps listing to events for person added via floating button
    initializeData();
  }

  void onPersonChanged(Person event) {
    //change your list of people here
    personViewModel.personList.add(event);
    //personListController steams new data to widgets
    personListController.add(personViewModel.personList);
  }

  //intially the data gets loaded from view Model where you can call your rest api
  Future initializeData() async {
    List<Person> initialList = await personViewModel.personList;
    personListController.add(initialList);
  }
}