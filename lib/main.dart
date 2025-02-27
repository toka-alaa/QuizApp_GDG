import 'package:flutter/material.dart';

import 'Quiz App/Quiz_App.dart';


void main ()
{
  runApp ( Quiz_App());
}


class Quiz_App extends StatelessWidget {
  const Quiz_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.black,
        body: Home(),
      ),
    );
  }
}
