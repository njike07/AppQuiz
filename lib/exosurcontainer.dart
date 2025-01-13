import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
            color: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                color: const Color.fromARGB(255, 15, 47, 206),
              ),
            )),
      ),
    );
  }
}
