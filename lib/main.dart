import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/views/select_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelectPage(),
    );
  }
}
