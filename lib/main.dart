import 'package:flutter/material.dart';
import 'package:machine/views/home.dart';
import 'package:machine/views/mobile_ui.dart';
import 'package:machine/views/otp_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      MobileUi(),
      // otp_ui(),

      // HomeUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
