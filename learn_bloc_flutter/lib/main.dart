import 'package:flutter/material.dart';
import 'package:learn_bloc_flutter/ui/screens/home_page.dart';
import 'package:learn_bloc_flutter/ui/screens/about_page.dart';
import 'package:learn_bloc_flutter/ui/screens/gallery_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Bloc Flutter',
      theme: ThemeData.light(),
      onGenerateRoute: (seting){
        switch(seting.name){
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/about':
            return MaterialPageRoute(builder: (context) =>  AboutPage(seting.arguments as Map<String, String>?));
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
      home:const HomePage(),
    );
  }
}
