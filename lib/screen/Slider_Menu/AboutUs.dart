import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xFF31906E).withOpacity(.9),
          title: Text("About Us"),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(right:240,top: 10),
              child: Text("About Us",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 18.0, right: 15),
              child: Text(
                "     Pick On hypermarket is  largest food and grocery store. With over 20,000 products and over a 1000 brands in our catalogue you will find everything you are looking for. Right from fresh Fruits and Vegetables, Rice and Dals, Spices and Seasonings to Packaged products, Beverages, Personal care products.Choose from a wide range of options in every category, exclusively handpicked to help you find the best quality available at the lowest prices Select the items for delivery and your order will be delivered right to your doorstep within specified radius of our store. You can pay online using your debit / credit card.We guarantee on time delivery, and the best quality!\n\n  Happy Shopping!!!!",
                style: TextStyle(color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:240,top: 20),
              child: Text("Contact Us",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.phone),
                  ),
                  Text("+91 9596970099",style: TextStyle(fontSize: 16,color:Colors.black54),)
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.email_outlined),
                ),
                Text("PickOn@gmail.com",style: TextStyle(fontSize: 16,color: Colors.black54),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:88),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset("asset/images/Copy.png",color: Colors.black54,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Pick On Company",style: TextStyle(color: Colors.black54),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
