
class Person{
  String name;
  String surName;

  Person({this.name,this.surName});

  factory Person.fromJson(Map<String,dynamic> json){
    return Person(
      name: json['name'],
      surName: json['sur_name'],
    );
  }
}