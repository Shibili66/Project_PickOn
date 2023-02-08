import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_on/screen/signUp.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'SignIn.dart';

class Signin_Signup extends StatefulWidget{
  @override
  State<Signin_Signup> createState() => _Signin_SignupState();
}

class _Signin_SignupState extends State<Signin_Signup> {

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async{
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true
            );
          }
        },
      );

  @override
  void dispose(){
    subscription.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.white,
       body: Container(
         width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage("asset/images/pic23456.jpg",),
                 fit: BoxFit.cover
             )
         ),
         child: Column(
           children: [
             SizedBox(
               height: 160,
             ),
             Text("Pick On",style: GoogleFonts.lilitaOne(textStyle: TextStyle(color:Color(0xFF31906E).withOpacity(.9),),fontSize: 68)),
             Padding(
               padding: const EdgeInsets.only(left:30,bottom: 10),
               child: Text("Shopee..",style: GoogleFonts.lobster(textStyle: TextStyle(color:Colors.black),fontSize: 45),)
             ),
             Padding(
               padding: const EdgeInsets.only(left: 12,top:80),
               child: ElevatedButton(
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Color(0xFF31906E).withOpacity(.9),),
                     minimumSize: MaterialStateProperty.all(Size(310, 55)),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                     ),
                   ),
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> signIn()));
                   },child: Text("Login",style: TextStyle(color: Colors.white),)

               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 10,top: 15),
               child: ElevatedButton(
                   style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(Color(0xFFBDBDBD).withOpacity(.5),),
                       minimumSize: MaterialStateProperty.all(Size(310, 55)),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30.0),

                           )
                       )
                   ),
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> signUp()));
                   }, child: Text("Sign Up",style: TextStyle(color: Colors.black),)),
             ),
           ],
         ),
       ),

     ),
   );
  }

  void showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("No Connection"),
        content: Text("Please check your internet Connectivity"),
        actions: <Widget>[
          TextButton(onPressed: () async {
            Navigator.pop(context, 'cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (! isDeviceConnected){
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
            child: Text('OK'),)
        ],
      )
  );
}
