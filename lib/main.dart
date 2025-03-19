import 'package:login_signup_page/login.dart';
import 'package:login_signup_page/signup.dart';
import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
   home:HomePage(),
 ));
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/welcome.gif"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("CHICAGO!!!!",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      color:const Color.fromARGB(255, 10, 48, 164),
                      fontSize: 40,
                    ),
                  )
                ],
              ),

              Column(
                children: <Widget>[
                  //login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    color: Color.fromARGB(255, 62, 42, 66),//define shape
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  //signup button'
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                    },//define shape
                    color: Color.fromARGB(255, 62, 42, 66),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),)
                  
                ],
              )
            ],
          ),
        ) ,
      ),
    );

  }
}