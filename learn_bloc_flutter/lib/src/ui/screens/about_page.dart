import 'package:flutter/material.dart';
import 'package:learn_bloc_flutter/src/ui/components/static_navigate.dart';

import '../components/direct_navigation.dart';
import '../components/dynamic_navigation.dart';

class AboutPage extends StatelessWidget {
  final Map<String, String>? arguments;
  const AboutPage(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('About Page ${arguments?['user']}'),
        ],
      ),
    );
  }
}
