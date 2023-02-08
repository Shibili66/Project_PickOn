import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOders extends StatefulWidget {
  @override
  State<MyOders> createState() => _MyOdersState();
}

class _MyOdersState extends State<MyOders> {
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF31906E).withOpacity(.9),
        title: Text("My Oders"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20,bottom: 40),
            child: Image(image: AssetImage("asset/images/empty-cart.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("No Oders...",style: Theme.of(context).textTheme.headline6,),
          ),
        ],
      ),
    ),
  );
  }
}