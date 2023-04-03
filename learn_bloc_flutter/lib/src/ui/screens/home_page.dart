import 'package:flutter/cupertino.dart';
import 'package:learn_bloc_flutter/src/ui/components/direct_navigation.dart';
import 'package:learn_bloc_flutter/src/ui/components/dynamic_navigation.dart';

import '../components/static_navigate.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Home Page'),
        SizedBox(
          height: 20,
        ),
        // StaticNavigate(),
        DynamicNavigation()
      ],
    ));
  }
}
