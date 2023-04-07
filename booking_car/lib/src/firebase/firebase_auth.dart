import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthApp {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void Register(String name, String email, String phone, String password,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _createUser(value.user?.uid as String, name, phone, onSuccess, onRegisterError);
    }).catchError((onError) {
      onError();
      _onSignUpErr(onError.code, onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    print(code);
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function onError) async {
    var user = {"name": name, "phone": phone};
    DatabaseReference ref = FirebaseDatabase(
            databaseURL:
                "https://booking-car-2023-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref()
        .child("users/${userId}");
    await ref.set(user).then((value) {
      onSuccess();
    }).catchError((onError) {
      onError();
    });
  }
}
