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


          Image.asset("lib/assets/images/Loginpage.icon.png", width: 350, ),

          SizedBox(height: 20,),

          SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0x33F5F5F5),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email_outlined, size: 30,),
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
                      borderSide: BorderSide(color: Colors.grey, width: 1.5)

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)

                  )
              ),
            ),
          ),

          SizedBox(height: 15,),

          SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0x33F5F5F5),

                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock, size: 30,),
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
                    borderSide: BorderSide(color: Colors.grey, width: 1.5)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black, width: 1.5)
                ),
                // prefixIconConstraints: BoxConstraints(minWidth: 50),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 150,),
            child: TextButton(onPressed: (){}, child: Text("Forgot your Password?", style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w400
            ),)),
          ),

          SizedBox(height: 20,),

          Container(
            height: 54,
            width: 226,
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(9)
            ),
            child: Center(
              child: Text("Login", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SizedBox(height: 20,),
          
          Row(
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
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
