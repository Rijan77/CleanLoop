
import 'package:cleanloop/pages/LoginPage.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

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

    final _auth = AuthService();

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
                    radius: 65,
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
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: InkWell(
              onTap: () async{
               await _auth.signout();
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return Loginpage();
               }));
              },
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth *0.5,
                decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(9)
                ),
                child: Center(
                  child: Text("Logout", style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "calistoga",
                    letterSpacing: 2,
                  ),),
                ),
              
              
              
              ),
            ),
          )
        ],
      ),
    );
  }
}
