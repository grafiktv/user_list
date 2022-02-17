import 'dart:async';
import 'dart:convert';
//import 'dart:ui';
import 'package:http/http.dart' as http;
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_list/screen/detailuser.dart';
import 'package:user_list/screen/user.dart';
import 'package:user_list/screen/navigation.dart';
import 'package:user_list/screen/userinfo.dart';
import 'global.dart' as global;





Future<List<User>> _fetchUsersList() async {
  final response = await http.get(Uri.parse(global.urlUser));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Ошибка загрузки users по API');
  }
}

ListView _usersListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(data[index].name, data[index].email, Icons.account_circle_rounded, data[index].id, context);
         
      });
}

ListTile _userListTile(String title, String subtitle, IconData icon, int index, context) => ListTile(
  
  title: Text(title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  subtitle: Text(subtitle),
  leading: Icon(
    icon,
    color: Colors.blue[500],
  ),
  onTap: () {
global.choseIndex = index.toString();
global.urlUserInfo = global.urlUser+global.choseIndex;
global.index = index-1;
  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserInfo(index: index)
                    
                    ),);
    
}
);




class UsersListLoad extends StatefulWidget {
  const UsersListLoad({Key? key}) : super(key: key);

  @override
  _UsersListLoadState createState() => _UsersListLoadState();
  
}

class _UsersListLoadState extends State<UsersListLoad> {
  
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;


  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<User>>(
        future: futureUsersList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            usersListData = snapshot.data!;
            return _usersListView(usersListData);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        })
    );
  }
}


class onTapItemState extends StatefulWidget {
  const onTapItemState({ Key? key }) : super(key: key);

  @override
  _onTapItemState createState() => _onTapItemState(
    
  );
}

class _onTapItemState extends State<onTapItemState> {
   //int _selectedIndex = 0;
   
  
  @override
  void initState(){
    super.initState();
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Навигация1'),
      
    ));
  }
}

