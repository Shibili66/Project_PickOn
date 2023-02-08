
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pick_on/screen/reusable_widgets.dart';
import 'SignIn.dart';

class changepassword extends StatefulWidget{
  const changepassword({Key? key}) : super(key: key);
  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {

  TextEditingController _emailTextController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Color(0xFF31906E),Colors.grey,Color(0xFF31906E)],
                  begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.only(top: 40,left: 10),
                 child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:100,left: 12),
                      child: Text("Forgot Password ",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:70,left: 10),
                      child: reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController,),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 60,left:8),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all( Colors.white70,),
                              minimumSize: MaterialStateProperty.all(Size(270, 50)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )
                              )
                          ),onPressed: (){
                            Navigator.of(context).pop();
                      }, child: Text("Forgot Password",style: TextStyle(color: Colors.black54),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn(),));
                      }, child: Text("LogIn",style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ],
            ),
               ),
             ),
        ),
      ),
    );
  }
}

