import 'dart:async';

import 'package:booking_car/src/firebase/firebase_auth.dart';

import '../validators/auth_vadilation.dart';

class AuthBloc {
  var _fireAuth = FirebaseAuthApp();
  final StreamController _nameController = new StreamController();
  final StreamController _emailController = new StreamController();
  final StreamController _phoneController = new StreamController();
  final StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get passStream => _passController.stream;

  bool isValidLogin(String email, String password) {
    if (!AuthValidations.isNotNull(email)) {
      _emailController.sink.addError("Email không được để trống!");
      return false;
    }
    if (!AuthValidations.isValidEmail(email)) {
      _emailController.sink.addError("Email không hợp lệ!");
      return false;
    }
    _emailController.sink.add('OK');
    if (!AuthValidations.isNotNull(password)) {
      _passController.sink.addError("Passsword không được để trống!");
      return false;
    }
    _passController.sink.add('OK');
    return true;
  }

  bool isValidRegister(
      String email, String name, String phone, String password) {
    //Validate for Name
    if (!AuthValidations.isNotNull(name)) {
      _nameController.sink.addError("name không được để trống!");
      return false;
    }
    _nameController.sink.add('OK');

    //Validate for Phone
    if (!AuthValidations.isNotNull(phone)) {
      _phoneController.sink.addError("Phone number không được để trống!");
      return false;
    }

    if (!AuthValidations.isValidVnPhone(phone)) {
      _phoneController.sink.addError("Phone number không hợp lệ!");
      return false;
    }
    _phoneController.sink.add('OK');
    //Validate for Email
    if (!AuthValidations.isNotNull(email)) {
      _emailController.sink.addError("Email không được để trống!");
      return false;
    }
    if (!AuthValidations.isValidEmail(email)) {
      _emailController.sink.addError("Email không hợp lệ!");
      return false;
    }
    _emailController.sink.add('OK');

    //Validate for Password
    if (!AuthValidations.isNotNull(password)) {
      _passController.sink.addError("Passsword không được để trống!");
      return false;
    }
    _passController.sink.add('OK');

    return true;
  }
  void Register(String name, String email, String phone, String password, Function onSuccess,  Function(String) onError){
    _fireAuth.Register(name, email, phone, password, onSuccess, onError);
  }

  
  void Login(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _phoneController.close();
    _passController.close();
  }
}
