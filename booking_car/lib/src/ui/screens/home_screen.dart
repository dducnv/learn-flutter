import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const route = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: CameraPosition(
              target: LatLng(10.7915178, 106.7271422),
              zoom: 14.4746,
            )),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: ElevatedButton(
                        onPressed: () {
                          print("click menu");
                        },
                        child: Image.asset("assets/images/ic_menu.png")),
                    actions: <Widget>[Image.asset("assets/images/ic_notify.png")],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
