import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/home_screen.dart';
import 'provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ChangeNotifierProvider<TimerProvider>
        (
        create: (context)=>TimerProvider(),
          child: HomeScreen(),
      ),
    );
  }
}