import 'package:cleanloop/pages/LoginPage.dart';
import 'package:flutter/material.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Image.asset("lib/assets/images/Vector 2.png"),
          SizedBox(
            width: 230,
              height: 230,
              child: Image.asset("lib/assets/images/cleanloop logo.png", fit: BoxFit.cover,)),

          Text("Your Smart Solution for a Cleaner Community"),

          SizedBox(height: 40,),

          Container(
            height: screenHeight * 0.22,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 2
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 15),
              child: Text("Your smart solution for waste management."
                  " Track your waste, learn recycling tips,"
                  " and take part in community events to make a positive impact on the environment effortlessly.", style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),),
            ),
          ),

          SizedBox(height: screenHeight * 0.07,),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage()));
            },
            child: Container(
              height: screenHeight *0.08,
              width: screenWidth * 0.67,
            
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(9)
              ),
              child: Center(child: Text("Get Started", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),)),
            ),
          )
        ],

      ),

    );
  }
}
