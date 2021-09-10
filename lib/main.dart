import 'package:flutter/material.dart';
import 'package:loan_application_shared_preferences/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Application Shared Preferences',
      theme:
          ThemeData(primarySwatch: Colors.blue, platform: TargetPlatform.iOS),
      home: HomePage(),
    );
  }
}
