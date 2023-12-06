import 'package:flutter/material.dart';

class luchtFotoAdvicePage extends StatefulWidget {
  const luchtFotoAdvicePage({super.key});

  @override
  State<luchtFotoAdvicePage> createState() => _luchtFotoAdvicePageState();
}

class _luchtFotoAdvicePageState extends State<luchtFotoAdvicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advies Luchtfoto's"),
      ),
    );
  }
}
