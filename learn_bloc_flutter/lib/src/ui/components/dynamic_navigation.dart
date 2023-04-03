import 'package:flutter/material.dart';

class DynamicNavigation extends StatelessWidget {
  const DynamicNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Dynamic Navigation", style: TextStyle(fontSize: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about',arguments: {
                  "user":"Nguyen Van Duc"
                });
              },
              child: const Text('About'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery');
              },
              child: const Text('Gallery'),
            ),
          ],
        )
      ],
    );
  }
}
