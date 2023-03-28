import 'package:flutter/material.dart';

class SOS_Screen extends StatefulWidget {
  const SOS_Screen({Key? key}) : super(key: key);

  @override
  State<SOS_Screen> createState() => _SOS_ScreenState();
}

class _SOS_ScreenState extends State<SOS_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Text(
          "SOS Screen",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
