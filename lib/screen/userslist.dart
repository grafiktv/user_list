import 'package:flutter/material.dart';

class User {
  String? Name;
  String? Phone;

  User({this.Name, this.Phone});
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;


  final users = <User>[
    User(Name: 'Егоров Илья Адамович', Phone: '+79992204455'),
    User(Name: 'альцева Милана Георгиевна', Phone: '+79692204456'),
    User(Name: 'Казанцев Даниил Миронович', Phone: '+79992204457'),
    User(Name: 'Зайцева Айлин Кирилловна', Phone: '+79952204465'),
    User(Name: 'Ерофеев Герман Александрович', Phone: '+79692604475'),
    User(Name: 'Михайлов Сергей Лукич', Phone: '+79942204440'),
    User(Name: 'Козлов Платон Дмитриевич', Phone: '+79942204568'),
    User(Name: 'Ковалев Михаил Михайлович', Phone: '+79692204678'),
  ];


  @override
  void initState(){
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(

          leading: Icon(Icons.account_circle_rounded),
          title:  Text('${users[index].Name!}   ${users[index].Phone!}'),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    );
  }
}




class ListPhoneView extends StatelessWidget {
  const ListPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: MyStatefulWidget(),
      ),
    );
  }
}
