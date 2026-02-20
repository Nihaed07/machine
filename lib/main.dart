import 'package:flutter/material.dart';
import 'package:machine/view_models/provider.dart';
import 'package:machine/views/mobile_ui.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()..fetchData(),),
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      MobileUi(),
  
      debugShowCheckedModeBanner: false,
    );
  }
}