import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Image.asset("lib/assets/images/Vector 2.png"),

          SizedBox(height: 5,),

          Image.asset("lib/assets/images/loginpage.icon.png", width: 300,)
        ],
      ),

    );
  }
}
