import 'package:flutter/material.dart';
import 'package:ip_finder/features/ip_finder/presentation/screens/main_screen/main_screen.dart';
import 'package:ip_finder/injection_container.dart' as di;
void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}


