import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_on/screen/reusable_widgets.dart';
import 'package:pick_on/screen/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'First Main.dart';
import 'Forgot password.dart';


class signIn extends StatefulWidget{
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool variable = true;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ Color(0xFF31906E), Colors.grey, Color(0xFF31906E)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: [
                  Text('Welcome', style: GoogleFonts.lobster(
                      textStyle: TextStyle(color: Colors.black),
                      fontSize: 55),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sign in with your email and password",
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  reusableTextField(
                    "Enter Email Id", Icons.person_outline, false,
                    _emailTextController,),
                  SizedBox(
                    height: 20,
                  ),
              TextField(
                controller: _passwordTextController,
                obscureText: variable,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
                decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline,color: Colors.white70,),
                    suffixIcon: IconButton(
                        icon: variable
                            ? const Icon(Icons.remove_red_eye,color:Color(0xFF31906E))
                            : const Icon(Icons.visibility_off,color:Color(0xFF31906E)),
                        onPressed: () {
                          setState(() {
                            variable ? variable = false : variable = true;
                          });
                        }),
                    label:  Text('password'),
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    )
                ),
              ),
                  SizedBox(
                    height: 40,
                  ),
                  signInsignUpButton(context, true, () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Firstmain()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },),
                  signUpOption(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Forgotpass(),
                  )
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don`t have account?", style: TextStyle(color: Colors.white70),),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signUp()));
          },
          child: Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Row Forgotpass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Forgot Password?", style: TextStyle(color: Colors.white70),),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => changepassword()));
          },
          child: Text(
            " Here !!", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
