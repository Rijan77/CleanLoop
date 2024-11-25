import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      extendBodyBehindAppBar: true,
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
             
             Image.asset("lib/assets/images/Vector 2.png"),
             SizedBox(
              height: screenHeight *0.18,
         
         
                 child: Image.asset("lib/assets/images/ForgotPassword.png", fit: BoxFit.cover,)),
         
             SizedBox(height: screenHeight *0.01,),

             const Text ("Forgot Password", style: TextStyle(
               // fontFamily: "Montserrat",
               fontWeight: FontWeight.w500,
               fontSize: 30
             ),),

             SizedBox(height: screenHeight *0.1,),
             
             const Text("Enter Your Email Address", style: TextStyle(
               fontSize: 15,
               // fontWeight: FontWeight.w400
             ),),
         
             SizedBox(height: screenHeight *0.01,),
         
             SizedBox(
               height: screenHeight *0.1,
               width: screenWidth * 0.8,
               child: const TextField(
                 decoration: InputDecoration(
                   hintText: "example@gmail.com",
                   hintStyle: TextStyle(
                     fontSize: 17,
                     color: Colors.black54
                   ),

                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Colors.black54)
         
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 2, color: Colors.black),
         
                   )
                 )
               ),
             ),


             SizedBox(height: screenHeight *0.05,),

         Container(
           height: screenHeight * 0.063,
           width: screenWidth * 0.6,
           decoration: BoxDecoration(
             color: Colors.green.shade500,
             borderRadius: BorderRadius.circular(9),
           ),
           child: const Center(
             child: Text(
             "Send",
             style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
                 fontFamily: "calistoga",
               letterSpacing: 2
             ),
                    ),
           ),
         ),

             SizedBox(height: screenHeight * 0.04),
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


           ],
         ),
       ),
    );
  }
}
