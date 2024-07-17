import 'package:flutter/material.dart';
import 'package:wordpath/screens/home_screen.dart';
// 'your_project' kendi proje adınız ile değiştirin

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
