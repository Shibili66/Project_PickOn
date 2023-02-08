import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_on/screen/Signin_Signup.dart';

class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds:10),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => Signin_Signup()
              )
          )
      );
    }
    @override
    Widget build(BuildContext context) {
      return
         SafeArea(
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Scaffold(
               body: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                   decoration: BoxDecoration(
                       gradient: LinearGradient(colors:[Color(0xFF31906E),Colors.grey,Color(0xFF31906E)],
                           begin: Alignment.topCenter,end: Alignment.bottomCenter)
                   ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:250),
                              child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset("asset/images/pngaaassssss.com-3457717.png")),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                      height: 20,
                                      child: Image.asset("asset/images/Copy.png",color: Colors.white70,)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Pick On Company",style: TextStyle(color: Colors.white70),),
                                  )
                                ],
                              ),
                            )
                          ],

                      ),
                 ),
               
             ),
           ),
         );
    }
  }
