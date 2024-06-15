import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoSwitch(
          value: _isChecked,
          onChanged: (value) => setState(
            () {
              _isChecked = value;
            },
          ),
        ),
      ),
    );
  }
}
