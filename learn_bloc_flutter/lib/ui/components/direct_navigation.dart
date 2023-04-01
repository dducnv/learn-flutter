import 'package:flutter/material.dart';
import 'package:learn_bloc_flutter/ui/screens/about_page.dart';
import 'package:learn_bloc_flutter/ui/screens/gallery_page.dart';
import 'package:learn_bloc_flutter/ui/screens/home_page.dart';

class DirectNavigation  extends StatelessWidget {
  const DirectNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   'MaterialPage Route',
        //   style: TextStyle(fontSize: 10),
        // ),
        // Row(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => HomePage()));
        //       },
        //       child: Text("Home"),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => AboutPage()));
        //       },
        //       child: Text("About"),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => GalleryPage()));
        //       },
        //       child: Text("Gallery"),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
