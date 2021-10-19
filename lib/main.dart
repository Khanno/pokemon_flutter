import 'package:flutter/material.dart';
import 'package:pokemon_flutter/pages/dashboard/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => DashboardPage(),
      },
    );
  }
}
