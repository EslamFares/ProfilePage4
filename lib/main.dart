import 'package:flutter/material.dart';

import 'Pofile4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile4',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Profile4(),
    );
  }
}
