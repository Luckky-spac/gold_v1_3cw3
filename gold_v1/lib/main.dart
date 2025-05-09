import 'package:flutter/material.dart';
import 'package:gold_v1/provider/auth_provider.dart';
import 'package:gold_v1/screens/auth/login.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=> AuthProvider())],child: const MyApp(),));

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}