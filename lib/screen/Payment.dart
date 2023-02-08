import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Cart/CartProvider.dart';
import '../Cart/Cart_screen.dart';
import 'First Main.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.grey[200],
       appBar: AppBar(
         leading: InkWell(
             onTap: (){Navigator.pop(context);},
             child: Icon(Icons.arrow_back,color: Color(0xFF31906E))),
         backgroundColor: Colors.transparent,
         elevation: 0,
         title: Text("Payments",style: TextStyle(color:Color(0xFF31906E)),),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(vertical: 10),
         children: [
           RadioListTile<int>(
               value: 0,
               groupValue: selectedValue,
               title: Text("Cash On Delivery"),
               onChanged: (value) => setState(() => selectedValue = 0,
               ),),
           Divider(),
           RadioListTile<int>(
             value: 1,
             groupValue: selectedValue,
             title: Text("UPI"),
             subtitle: Text("Googel pay,Phone Pe,Paytm,ect.."),
             onChanged: (value) => setState(() => selectedValue = 1,
             ),),
           Divider(),
           RadioListTile<int>(
             value: 2,
             groupValue: selectedValue,
             title: Text("Wallets"),
             subtitle: Text("Phone Pe,Paytm"),
             onChanged: (value) => setState(() => selectedValue = 2,
             ),),
           Divider(),
           RadioListTile<int>(
             value: 3,
             groupValue: selectedValue,
             title: Text("Net Banking"),
             onChanged: (value) => setState(() => selectedValue = 3,
             ),),
           Divider(),
           RadioListTile<int>(
             value: 4,
             groupValue: selectedValue,
             title: Text("Credit / Debit / ATM Card"),
             subtitle: Text("Add and secure your card as RBI guidelines"),
             onChanged: (value) => setState(() => selectedValue = 4,
             ),),
           Divider(),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 50,
               width: MediaQuery.of(context).size.width*0.2,
               color: Colors.white54,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Icon(Icons.add,size: 28,color: Colors.black54,),
                     Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: Text("Add Gift Card"),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           Container(
             width: double.infinity,
             height: 130,
             color: Colors.white54,
               child: Consumer<CartProvider>(builder: (context, value, child){
                 return Visibility(
                   visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                     child: Center(
                       child: Column(
                         children: [
                           ReusableWidget(title: 'Sub Total', value: r'Rs. '+value.getTotalPrice().toStringAsFixed(2)),
                           ReusableWidget(title: 'Delivery Charges', value: r'FREE ',),
                           Divider(),
                           SizedBox(
                               height: 30,
                               child: ReusableWidget(title: 'Amount Payable', value: r'Rs. '+value.getTotalPrice().toStringAsFixed(2))),
                           ]
                       ),
                     ),
                   ),
                 );
               })
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 122,
               width: double.infinity,
               color: Colors.white54,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     children: [
                                SizedBox(
                   height: 100,
                   width: 100,
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: Image.asset("asset/images/ORIGINAL.png"),
                   )),
                       Padding(
                         padding: const EdgeInsets.only(left: 55,bottom:25),
                         child: SizedBox(
                             height: 40,
                             width: 40,
                             child: Image.asset("asset/images/CARD.....png")),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 90,bottom: 27),
                         child: SizedBox(
                             height: 40,
                             width: 40,
                             child: Image.asset("asset/images/Box.....png")),
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(bottom: 5,left: 2),
                         child: Text("Authentic Products",style: TextStyle(color: Colors.black54,fontSize: 13),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 20.0,bottom: 4),
                         child: Text("Secure Payments",style: TextStyle(color: Colors.black54,fontSize: 13),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 30.0,bottom: 4),
                         child: Text("Easy Returns",style: TextStyle(color: Colors.black54,fontSize: 13),),
                       )
                     ],
                   )
                 ],
               ),

           )
           ),
           ElevatedButton(
               style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Color(0xFF31906E).withOpacity(.9),),
                   minimumSize: MaterialStateProperty.all(Size(130, 50)),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ))),
               onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("asset/animation/83666-payment-successfull.json"),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xFF31906E))
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstmain(),));
                                },
                                child: Text("Ok")),
                          )
                        ],
                      ),
                      
                    );
                      }
                  );
               },
               child: Text("Continue")),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               width: double.infinity,
               height: 80,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("asset/images/Cards.....png"),
                   fit: BoxFit.fill
                 )
               ),
             ),
           )
         ],
       ),
     ),
   );
  }
}
