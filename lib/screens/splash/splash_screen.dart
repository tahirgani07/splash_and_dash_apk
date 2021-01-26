import 'package:flutter/material.dart';
import 'package:splash_and_dash_apk/screens/splash/components/body.dart';
import 'package:splash_and_dash_apk/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
