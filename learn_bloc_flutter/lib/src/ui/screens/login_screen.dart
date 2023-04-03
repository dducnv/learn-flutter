import 'package:flutter/material.dart';

import '../../blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = new LoginBloc();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Center(
                child: Text('Login Screen',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder(
                stream: loginBloc.userStream,
                builder: (context, snapshot) {
                  return TextField(
                    obscureText: false,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      errorText:
                          snapshot.hasError ? snapshot.error as String : null,
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
                stream: loginBloc.passStream,
                builder: (context, snapshot) {
                  return TextField(
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      errorText:
                          snapshot.hasError ? snapshot.error as String : null,
                    ),
                  );
                }),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()=>clickLogin(), child: Text('Login'))
          ],
        ),
      ),
    );
  }

  void clickLogin() {
    if (loginBloc.isValidInfo(_usernameController.text, _passController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Login success",
      )));
    }
  }
}
