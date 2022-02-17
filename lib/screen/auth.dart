import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_list/screen/navigation.dart';
import 'global.dart' as global;

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key }) : super(key: key);
 

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = new GlobalKey<FormState>();
  String? errorText = null; 
 //String _email;
//String _password;
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

 
 void auth()
  {final login = _phoneTextController.text;
  final password = _passwordTextController.text;
  

  if (login == '9318888888' && password == '123456')

  { errorText = null;
    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FirstRoute()),);
                    }
  else {
    errorText = 'Не верный логин/пароль';
  showDialog<void>(
        context: context,
       
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ошибка'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Не верный логин/пароль'),
                  
                ],
              ),
            ),
            actions: <Widget>[
              
              TextButton(
                child: const Text('Закрыть'),
                onPressed: () {Navigator.of(context).pop();
                    }
              ),
            ],
          );
        },
      );
  }
  
  setState() {};
  } 

  
  @override
  Widget build(BuildContext context) {


final String? errorText = this.errorText;
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
            color: Color(0xFFeceff1), width: 2));

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Авторизация'),
        ),
          body: Container(
            decoration: BoxDecoration(

            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Form(key: formKey,
              child: Column(children: [
                SizedBox(height: 20, ),
                Text("Введите логин",
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                Text("в виде 10 цифр номера телефона",
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                SizedBox(height: 30, ),
                SizedBox(width: 224,
                  child: TextFormField(
                    controller: _phoneTextController,
                    //onSaved: (val) => _login = val,
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffd6dce5),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: ' Телефон',
                  ),
                    //initialValue: '9318888888', //Убрать потом
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],

                  ),
                ),
                SizedBox(height: 30, ),
                SizedBox(width: 224,
                  child: TextFormField(
                    controller: _passwordTextController,
                    obscureText: true, 
                    maxLines: 1,
                    //onSaved: (val) => _password = val,
                  validator: (String? value)
                  {if (value == null || value.isEmpty) return 'Пожалуйста введите пароль';
                  if (errorText != null) return (errorText);},
                    decoration: InputDecoration(

                      filled: true,
                      fillColor: Color(0xffd6dce5),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Пароль',
                    ),),
                ),
                SizedBox(height: 50,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: ()
                  {
                    if (formKey.currentState!.validate())
                    
                    auth();
                    

                    },
                 child: Text("Войти"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )
                  ),
                ),
                
                ),
                
              ] , ),
            ),
            ),
          )
      ),
    );
  }



      

// void submit() {
//      final form = formKey.currentState;
//      if (form.validate()) {
//        form.save();
//        performLogin();
//      }
//    }

// void _loginUser()
// {
//   _email = email.text;
//   _password = password.text;
// }

// }

// void performLogin() {
    
//     Navigator.push(
//         context,
//         new MaterialPageRoute(
//             builder: (context) => new FirstRoute()));
  
  
  }