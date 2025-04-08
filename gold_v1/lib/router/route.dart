import 'package:flutter/material.dart';
import 'package:gold_v1/screens/auth/login.dart';
import 'package:gold_v1/screens/auth/register.dart';
import 'package:gold_v1/screens/auth/home.dart';
import 'package:gold_v1/screens/auth/pin_login.dart';

class AppRoute {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
        case 'pinLogin':
        return MaterialPageRoute(
          builder: (context) => const PinLogin(),
        );
      case 'register':
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case 'home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(), // Replace with actual Home widget
        ); 
      default:
        throw const FormatException("Route not found!");
    }

    }
  }
  

