import 'package:cleanloop/pages/LoginPage.dart';
import 'package:cleanloop/pages/OnboardingPage.dart';
import 'package:cleanloop/pages/auth_service.dart';
import 'package:flutter/material.dart';

import 'CustomDialog.dart';


class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  bool _isPasswordVisible = false;

  final _name = TextEditingController();
  final _number = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      extendBodyBehindAppBar: true,
      // Add this - Custom AppBar with transparent background-
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 40,),
          onPressed: () {
            // Navigate back to login page
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Adjust image width based on screen width
            Image.asset(
              "lib/assets/images/Vector 2.png",
              width: screenWidth,
              fit: BoxFit.cover,
            ),
            const Text("Sign Up", style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold
            ),),
            const Text ("Create Your Account", style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x33F5F5F5),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person, size: 30),
                        SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            color: Colors.black54,
                            thickness: 1.5,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  labelText: "Enter your name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x33F5F5F5),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone_android_rounded, size: 30),
                        SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            color: Colors.black54,
                            thickness: 1.5,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  labelText: "Enter your phone number",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x33F5F5F5),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email_outlined, size: 30),
                        SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            color: Colors.black54,
                            thickness: 1.5,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  labelText: "Enter your email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _password,
                obscureText:  !_isPasswordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x33F5F5F5),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });

                      }, icon: Icon(

                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off

                  )),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock, size: 30),
                        SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            color: Colors.black54,
                            thickness: 1.5,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            InkWell(
              onTap: _signup,
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or Continue with",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: screenWidth * 0.14,
                    width: screenWidth * 0.14,
                    child: Image.asset("lib/assets/images/google.logo.png"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: screenWidth * 0.16,
                    width: screenWidth * 0.16,
                    child: Image.asset("lib/assets/images/facebook.logo.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ?  ",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Loginpage()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    }
  _signup() async{

    if (_email.text.isEmpty || _password.text.isEmpty){
      CustomDialog.showSnackBar(context: context, message: "Email and Password cannot be empty");
      return;
    }

    if (!_email.text.contains("@gmail.com")){
      CustomDialog.showSnackBar(context: context, message: "Please enter a valid email address.");
      return;
    }

    if(_password.text.length<6){
      CustomDialog.showSnackBar(context: context, message: "Password must be at least 6 characters.");
      return;
    }
    final user = await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if(user != null){
      CustomDialog.showSuccessDialog(
          context: context,
          title: "Success",
          message: "Welcome to the Cleanloop!",
        onConfirm: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Loginpage()));
        }

      );
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Loginpage()));
      });

    }
  }
}
