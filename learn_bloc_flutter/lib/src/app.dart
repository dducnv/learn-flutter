import 'package:flutter/material.dart';
import 'package:learn_bloc_flutter/src/ui/screens/about_page.dart';
import 'package:learn_bloc_flutter/src/ui/screens/gallery_page.dart';
import 'package:learn_bloc_flutter/src/ui/screens/home_page.dart';
import 'package:learn_bloc_flutter/src/ui/screens/login_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Bloc Flutter',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (seting) {
        switch (seting.name) {
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/about':
            return MaterialPageRoute(
                builder: (context) =>
                    AboutPage(seting.arguments as Map<String, String>?));
          case '/gallery':
            return MaterialPageRoute(builder: (context) => const GalleryPage());
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
      // routes: {
      //   '/home': (context) => const  HomePage(),
      //   '/about': (context) =>const  AboutPage(),
      //   '/gallery': (context) =>const  GalleryPage()
      // },
      home: const Material(child: LoginScreen()),
    );
  }
}
