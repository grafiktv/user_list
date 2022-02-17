import 'package:flutter/material.dart';
import 'package:user_list/screen/load_from_net.dart';
import 'package:user_list/screen/navigation.dart';
import 'package:user_list/screen/user.dart';
import 'package:user_list/screen/detailuser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'global.dart' as global;



Future <List<User>> getUserID() async 
{
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    final human = jsonResponse.map((dynamic e) => User.fromJson(e as Map<String, dynamic>)).toList();
    return human;
    
  } else {
    throw Exception('Ошибка загрузки users по API');
  }
}



ListView _userInfoListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userInfoListTile(data, index, context);

       
      });
}

ListTile _userInfoListTile(
        List usersListData, int index, context) =>
    ListTile(
        title: Text('${usersListData[index].name}'),
            leading: Icon(
          Icons.ac_unit,
          color: Colors.blue[500],
        ),
        onTap: () {
          // Navigator.push(context,
          //                   MaterialPageRoute(builder: (context) => DetailUser(title: title, index: index, subtitle: subtitle)),);
        });

Widget TextTlList (String usinfo, String titleu)
{return Container(child:
            Text('$titleu $usinfo', textScaleFactor: 1.1,),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            decoration: BoxDecoration(border: Border.all(
      color: Colors.blueAccent,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(5),));

}


class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, int? this.index}) : super(key: key);
  final int? index;

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;
  late Future<List<User>> userListID;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  var _currentPage = 0;

  final _pages = [
    
    const UserInfo(),
    const DetailUser(),
    ];
  
  @override
  void initState() {
    super.initState();
    userListID = getUserID();
    

   
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(scaffoldMessengerKey: _messengerKey,
    home: Scaffold(
      appBar: AppBar(
            title: const Text('Профиль'),
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
      body: Center(
      
        child: FutureBuilder<List<User>>(
            
            future: userListID,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                
                late final usersListData = snapshot.data!;
                
return 
Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          <Widget>[
    TextTlList(snapshot.data![global.index].name, 'Имя'),
    TextTlList(snapshot.data![global.index].email, 'E-mail'),
    TextTlList(snapshot.data![global.index].userName, 'Login'),
    TextTlList(snapshot.data![global.index].phone, 'Телефон'),
    TextTlList(snapshot.data![global.index].website, 'Сайт'),

            //Text('E-mail ${snapshot.data![global.index].email}'),
           // Text('Login ${snapshot.data![global.index].userName}'),
            Text('ID ${snapshot.data![global.index].id}'),
           // Text('Сайт ${snapshot.data![global.index].website}'),
            //Text('Телефон ${snapshot.data![global.index].phone}'),
            Text('Город ${snapshot.data![global.index].address.city}'),
            Text('Улица ${snapshot.data![global.index].address.street}'),
            Text('Штат ${snapshot.data![global.index].address.suite}'),
            Text('Индекс ${snapshot.data![global.index].address.zipcode}'),
            Text('Широта ${snapshot.data![global.index].address.geo.lat }'),
            Text('Долгота ${snapshot.data![global.index].address.geo.lng }'),
            Text('Название компании ${snapshot.data![global.index].company.name}'),
            Text('Слоган ${snapshot.data![global.index].company.catchPhrase}'),
            Text('БС ${snapshot.data![global.index].company.bs}'),
          ElevatedButton(onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailUser(title: snapshot.data![global.index].name, subtitle: snapshot.data![global.index].email)),);
          }, child: Text('Задачи') ,),
          ]
        
        ),
        
        
                );
                //_usersListView(usersListData);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            })
            ),
            
            )
            );
  }
}

class onTapItemState extends StatefulWidget {
  const onTapItemState({Key? key}) : super(key: key);

  @override
  _onTapItemState createState() => _onTapItemState();
}

class _onTapItemState extends State<onTapItemState> {
  //int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Навигация'),
    ));
  }
}


