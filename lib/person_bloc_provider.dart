
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management_bloc/person_bloc.dart';

class PersonBlocProvider extends InheritedWidget {
  final PersonBloc personBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PersonBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PersonBlocProvider) as PersonBlocProvider)
          .personBloc;

  PersonBlocProvider({Key key, PersonBloc personBloc, Widget child})
      : this.personBloc = personBloc ?? PersonBloc(),
        super(child: child, key: key);
}