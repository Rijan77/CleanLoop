import 'package:cleanloop/pages/RegistrationPage.dart';
import 'package:flutter/material.dart';

import 'Forgot_Password.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Adjust image width based on screen width
            Image.asset(
              "lib/assets/images/Vector 2.png",
              width: screenWidth,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Image.asset(
              "lib/assets/images/Loginpage.icon.png",
              width: screenWidth * 0.75,
            ),
            SizedBox(height: screenHeight * 0.029),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
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
                  labelText: "Email",
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
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.1),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword())); 
                  },
                  child: const Text(
                    "Forgot your Password?",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              height: screenHeight * 0.068,
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                color: Colors.green.shade500,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "calistoga",
                    letterSpacing: 2,
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
                  "Don’t have an account yet?  ",
                  style: TextStyle(
                    color: Colors.black54,
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registrationpage()));
                  },
                  child: const Text(
                    "Sign Up",
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
}
