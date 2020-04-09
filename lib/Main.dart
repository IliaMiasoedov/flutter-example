import 'package:flutter/material.dart';
import 'package:mbanking/src/app.dart';
import 'package:mbanking/InjectionContainer.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}