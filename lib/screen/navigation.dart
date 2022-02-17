import 'package:flutter/material.dart';
import 'package:user_list/screen/detailuser.dart';
import 'package:user_list/screen/load_from_net.dart';
import 'package:user_list/screen/userslist.dart';
import 'package:user_list/screen/userinfo.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  var _currentPage = 0;

  final _pages = [
    const UsersListLoad(),
    const UserInfo(),
    ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Навигация'),
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
                      child: const Text('Пользователи'),
                    )),
                ListTile(
                  leading: const Icon(Icons.feedback_outlined),
                  title: const Text("Детально"),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DetailUser()),);
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text('Переход в каталог')));

                  },
                ),
              
              ]
          ),
          
        ),
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              label: 'Пользователи',
              icon: Icon(Icons.videogame_asset),),
            const BottomNavigationBarItem(
              label: 'Подробно',
              icon: Icon(Icons.headset_outlined),),

          ],
          currentIndex: _currentPage,
          fixedColor: Colors.deepPurple,
          onTap: (int intIndex)
          {
            setState (() {
              _currentPage = intIndex;
            });

          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}

class FourRoute extends StatelessWidget {
  const FourRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}