import 'package:flutter/material.dart';
import 'package:projeto1/componenents/AppController.dart';
import 'package:projeto1/data/task_inherited.dart';
import 'package:projeto1/screens/inicial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
            builder: (context, child) {   
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: AppController.instance.IsDarkTheme 
            ? Colors.deepPurple
            : Colors.blue ,
            brightness:AppController.instance.IsDarkTheme 
            ? Brightness.dark 
            : Brightness.light

          ),
        home: TaskInherited(child: const inicialScreen())
        );
  });
      
  }
}
