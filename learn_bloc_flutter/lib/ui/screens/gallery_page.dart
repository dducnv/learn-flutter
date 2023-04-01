import 'package:flutter/cupertino.dart';

import '../components/direct_navigation.dart';
import '../components/dynamic_navigation.dart';
import '../components/static_navigate.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Gallery Page'),
          SizedBox(
            height: 20,
          ),
            DynamicNavigation()
        ],
      ),
    );
  }
}
