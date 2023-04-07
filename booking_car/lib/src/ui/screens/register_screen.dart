import 'package:booking_car/src/bloc/auth_bloc.dart';
import 'package:booking_car/src/ui/screens/login_screen.dart';
import 'package:booking_car/src/ui/widgets/logo_widget.dart';
import 'package:booking_car/src/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/loading_dialog.dart';
import '../widgets/msg_dilog.dart';

class RegisterScreen extends StatefulWidget {
  static const route = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
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
              const Text(
                "Welcome to",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              LogoWidget(fontSize: 20, color: GlobalColors.textColor),
              const SizedBox(height: 30),
              StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: false,
                      controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(),
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                        labelText: 'Fullname',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: authBloc.phoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: false,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(),
                        errorText:
                            snapshot.hasError ? snapshot.error as String : null,
                        labelText: 'Phone number',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
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
                  onPressed: () => handleRegister(),
                  child: Text('Register Now')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have any account!',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.route);
                    },
                    child: Text(
                      'Login',
                      style: const TextStyle(
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
    Navigator.pushNamed(context, LoginScreen.route);
  }

  void onError(msg) {
    LoadingDialog.hideLoadingDialog(context);
    MsgDialog.showMsgDialog(context, "Sign-Up", msg);
  }

  void handleRegister() {
    if (authBloc.isValidRegister(_emailController.text, _nameController.text,
        _phoneController.text, _passController.text)) {
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      authBloc.Register(_nameController.text, _emailController.text,
          _phoneController.text, _passController.text, onSuccess, onError);
    }
  }
}
