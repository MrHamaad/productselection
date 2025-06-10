import 'package:flutter/material.dart';
import 'package:mypractice/Screens/selection.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
        textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  color: Colors.red,
                  offset: Offset(1, 1)
                ),
              ]
          ),
          displayMedium: TextStyle(
            fontSize: 20
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Product Selection"
          ),
          centerTitle: true,
          elevation: 5,
        ),
        body: SelectionScreen(),
      ),
    );
  }
}


