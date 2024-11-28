import 'dart:ui';

import 'package:cleanloop/pages/LoginPage.dart';
import 'package:cleanloop/pages/OnboardingPage.dart';
import 'package:cleanloop/pages/homePage.dart';
import 'package:cleanloop/pages/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        } else if(snapshot.hasError){
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }else {
          if(snapshot.data == null){
            return Onboardingpage();
          } else{
            return Userprofile();
          }
        }

      }),
    );
  }
}
