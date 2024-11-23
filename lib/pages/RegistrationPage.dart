import 'package:cleanloop/pages/LoginPage.dart';
import 'package:flutter/material.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      extendBodyBehindAppBar: true,
      // Add this - Custom AppBar with transparent background
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
            Text("Sign Up", style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold
            ),),
            Text ("Create Your Account", style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: screenHeight * 0.05),
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
            Container(
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

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
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
}
