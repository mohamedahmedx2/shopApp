import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Text('Setting Screen',
        style: Theme.of(context).textTheme.bodyText1,
      )),
    );
  }
}
