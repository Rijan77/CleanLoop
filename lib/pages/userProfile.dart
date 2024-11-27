
import 'package:flutter/material.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
      Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight *0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff34D399),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80 ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: AssetImage("lib/assets/images/Rijan.jpg"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Text("Rijan Acharya", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),)
        ],
      ),
    );
  }
}
