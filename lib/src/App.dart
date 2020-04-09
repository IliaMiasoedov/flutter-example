import 'package:flutter/material.dart';
import 'package:mbanking/src/resource/strings.dart';
import 'package:mbanking/src/resource/theme.dart';
import 'package:mbanking/src/ui/home/homeScreen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : Strings.applicationName,
      theme: applicationTheme,
      home: HomeScreen()
    );
  }
}