import 'package:flutter/material.dart';

class StaticNavigate extends StatelessWidget {
  const StaticNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Static Navigate',
          style: TextStyle(fontSize: 10),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text("Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text("About"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery');
              },
              child: Text("Gallery"),
            ),
          ],
        )
      ],
    );
  }
}
