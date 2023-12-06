import 'package:flutter/material.dart';

class multiSpecAdvicePage extends StatefulWidget {
  const multiSpecAdvicePage({super.key});

  @override
  State<multiSpecAdvicePage> createState() => _multiSpecAdvicePageState();
}

class _multiSpecAdvicePageState extends State<multiSpecAdvicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advies Multispectraal"),
      ),
    );
  }
}
