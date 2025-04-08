import 'package:flutter/material.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutDialog(
        applicationName: 'Gold App',
        applicationVersion: '1.0.0',
        applicationIcon: Icon(Icons.lock),
        children: [
          Text('This is a simple pin login screen.'),
          Text('Please enter your pin to continue.'),
        ],
      ),
    );
  }
}