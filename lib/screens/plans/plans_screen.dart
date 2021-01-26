import 'package:flutter/material.dart';
import './components/body.dart';

class PlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your plan"),
      ),
      body: Body(),
    );
  }
}
