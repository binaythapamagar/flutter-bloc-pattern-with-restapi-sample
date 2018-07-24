
import 'dart:async';

import 'package:flutter_state_management_bloc/person_model.dart';

class PersonViewModel{

  List<Person> _personList = [
    Person(name: "Binay 1",surName: "Thapa Magar"),
    Person(name: "Binay 2",surName: "Thapa Magar"),
    Person(name: "Binay 3",surName: "Thapa Magar")
  ];
  PersonViewModel();

  Future<List<Person>> importNews() async{
    // if(Injector.isMockFlavour()){
    _personList = [
      Person(name: "Binay 1",surName: "Thapa Magar"),
      Person(name: "Binay 2",surName: "Thapa Magar"),
      Person(name: "Binay 3",surName: "Thapa Magar")
      ];
    return personList;
    // }

//    final RestManager manager = RestManager(subUrl: Helpers.NEWS_INFORMATION,method: HttpMethod.GET);
//    var result = manager.makeHttpGetRequest();
//    result.then((results)=> results.forEach((result)=>listNews.add(News.fromJson(result))));
//    return listNews;
  }

  List<Person> get personList => _personList;
}