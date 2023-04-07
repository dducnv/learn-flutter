import 'package:booking_car/src/ui/screens/home_screen.dart';
import 'package:booking_car/src/ui/screens/login_screen.dart';
import 'package:booking_car/src/ui/screens/register_screen.dart';
import 'package:booking_car/src/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        onGenerateRoute: (seting) {
          switch (seting.name) {
            case HomeScreen.route:
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            case LoginScreen.route:
              return MaterialPageRoute(builder: (_) => const LoginScreen());
            case RegisterScreen.route:
              return MaterialPageRoute(builder: (_) => const RegisterScreen());
            default:
              return MaterialPageRoute(builder: (_) => const LoginScreen());
          }
        },
        home: Material(
          child: WelcomeScreen(),
        ));
  }
}
