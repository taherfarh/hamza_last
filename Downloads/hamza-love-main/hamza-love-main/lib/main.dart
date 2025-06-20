
import 'package:flutter/material.dart';
import 'package:hamza/Features/splash/presentation/splash_view.dart';

void main() async {
  runApp(const MyApp());
 
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade200),
        useMaterial3: true,
      ),
      home:SplashView() ,
    );
  }
}
