import 'package:flutter/material.dart';
import 'package:user_list/screen/load_from_net.dart';
import 'package:user_list/screen/navigation.dart';
import 'package:user_list/screen/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'global.dart' as global;



class DetailUser extends StatefulWidget {
  const DetailUser({ Key? key, String? this.title, int? this.index, String? this.subtitle}) : super(key: key);
final String? title;
final int? index;
final String? subtitle;


  @override
  _DetailUserState createState() => _DetailUserState();
}

Future<List<UserTodo>> _fetchUsersDetail() async {
  
  String urlString = global.urlTodo+global.choseIndex;

  final responseDet = await http.get(Uri.parse(urlString));

  if (responseDet.statusCode == 200) {
    List jsonResponseDet = json.decode(responseDet.body);
    return jsonResponseDet.map((user) => UserTodo.fromJson(user)).toList();
  } else {
    throw Exception('Ошибка загрузки задач пользователей по API');
  }
}

class _DetailUserState extends State<DetailUser> {
   late Future<List<UserTodo>> futureUsersList;
  late List<UserTodo> _usersListData;
  bool _value = false;

  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersDetail();
  }

  @override
  Widget build(BuildContext context) {
    return 
      
    Scaffold(
      appBar: AppBar(
            title: const Text('Задачи'),
            actions: <Widget>[
                            IconButton(onPressed: ()
              {Navigator.pop(context);},
                  icon: const Icon(Icons.keyboard_backspace_outlined)),
              
  
            ]
        ),
        drawer: Drawer(
           child: ListView(
               padding: EdgeInsets.zero,
               children:[
                 DrawerHeader(
                     decoration: const BoxDecoration(
                       color: Colors.blue,
                     ),

                     child: Container(
                       height: 200,
                       child: const Text('Навигация'),
                     )),
                ListTile(
                   leading: const Icon(Icons.add_shopping_cart),
                   title: const Text("Корзина"),
                   onTap: ()
                   {Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const ThirdRoute()),
                   );},

                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Профиль"),
                  onTap: ()
                  {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                  );},
                ),
              ]
          ),
       ),
      body: Column(children: [
        Container(child: Text("Пользователь: ${widget.title}", textScaleFactor: 1.5,),
        ),
        Container(child: Text("E-mail: ${widget.subtitle}    ", textScaleFactor: 1.1,),
        ),
        
        Padding(padding: EdgeInsets.only(top: 20.0)),
       
 FutureBuilder<List<UserTodo>>(
        future: futureUsersList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _usersListData = snapshot.data!;
            return Expanded(
  child: ListView.builder(
    itemCount: _usersListData.length,
    itemBuilder: (context, index) {
      return CheckboxListTile(title: 
      Text('${_usersListData[index].title}'),
      value: _usersListData[index].comp, onChanged: (bool? value) {},
      );
    },
  )
);

          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        })
      ],
      
    ));
  }
}
  


 