import 'package:booking_car/src/bloc/auth_bloc.dart';
import 'package:booking_car/src/ui/screens/home_screen.dart';
import 'package:booking_car/src/ui/screens/register_screen.dart';
import 'package:booking_car/src/ui/widgets/logo_widget.dart';
import 'package:booking_car/src/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/loading_dialog.dart';
import '../widgets/msg_dilog.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              StreamBuilder(
                  stream: authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: false,
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(),
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                        labelText: 'Email',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: authBloc.passStream,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: true,
                      controller: _passController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(),
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                        labelText: 'Password',
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () => handleLogin(),
                  child: Text('Login')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.route);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSuccess() {
    LoadingDialog.hideLoadingDialog(context);
    Navigator.pushNamed(context, HomeScreen.route);
  }

  void onFalse(msg) {
    LoadingDialog.hideLoadingDialog(context);
    MsgDialog.showMsgDialog(context, "Sign-In", msg);
  }

  void handleLogin() {
    if (authBloc.isValidLogin(_emailController.text, _passController.text)) {
      LoadingDialog.showLoadingDialog(context, "Loading...");
      authBloc.Login(
          _emailController.text, _passController.text, onSuccess, onFalse);
    }
  }
}
