import 'package:flutter/material.dart';
import 'package:pick_on/screen/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'First Main.dart';

class signUp extends StatefulWidget{
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool variable = true;
  TextEditingController _userTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Sign Up",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Color(0xFF31906E),Colors.grey,Color(0xFF31906E)],
                begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,MediaQuery.of(context).size.height * 0.2,20,0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                reusableTextField("Enter UserName", Icons.lock_outline, false, _userTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
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
                signInsignUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                        print("Created New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Firstmain()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });

                }),
                Padding(
                  padding: const EdgeInsets.only(top:80),
                  child: Text("By continuing your confirm that you agree\n         with our Terms and Conditions.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black45)),
                )
              ],

            ),
          ),
        ),
      ),
    ),
  );
  }
}