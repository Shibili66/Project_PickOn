import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_on/screen/Payment/Payment.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import 'Cart.dart';
import 'db_Helper.dart';
import 'CartProvider.dart';

class Cartscreen extends StatefulWidget{
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       leading: InkWell(
           onTap: () {
             Navigator.pop(context);
           },
           child: Icon(Icons.arrow_back,color: Color(0xFF306754),)),
       backgroundColor:Colors.transparent,
       elevation: 0,
       title: const Center(child: Text("Cart",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold,color: Color(0xFF306754)),)),
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 20,top: 8),
           child: Badge(
             badgeContent:Consumer<CartProvider>(
               builder: (context, value, child){
                 return Text(value.getCounter().toString(),style: TextStyle(color:Colors.white),);
               },
             ),
             animationDuration: const Duration(microseconds: 300),
             child: const Icon(Icons.shopping_bag_outlined,color: Color(0xFF306754),),
           ),
         )
       ],
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           FutureBuilder(
           future:cart.getData(),
           builder: (context , AsyncSnapshot<List<Cart>> snapshot){
             if(snapshot.hasData){
               if(snapshot.data!.isEmpty){
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 40),
                       child: Image(image: AssetImage("asset/images/istockphoto-830239112-612x612.jpg")),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:16),
                       child: Text("Explore Products...",style: Theme.of(context).textTheme.headline6,),
                     ),
                   ],
                 );
               }else {
                 return Expanded(
                     child: ListView.builder(
                         itemCount: snapshot.data!.length,
                         itemBuilder: (context, index) {
                           return Card(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisSize: MainAxisSize.max,
                                     children: [
                                       Image(
                                           height: 100,
                                           width: 100,
                                           image: AssetImage(snapshot.data![index].image.toString())
                                       ),
                                       SizedBox(width: 10,),
                                       Expanded(
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(snapshot.data![index].productName.toString(),
                                                     style: TextStyle(
                                                         fontSize: 16,
                                                         fontWeight: FontWeight.bold),
                                                   ),
                                                   InkWell(
                                                       onTap: () {
                                                         dbHelper!.delete(snapshot.data![index].id!);
                                                         cart.removerCounder();
                                                         cart.removeTotalPrice(
                                                             double.parse(snapshot.data![index].productPrice.toString()));
                                                       },
                                                       child: Icon(Icons.delete))
                                                 ],),
                                               SizedBox(height: 5),
                                               Text(
                                                 snapshot.data![index].unitTag.toString() + " " + r"Rs." + snapshot.data![index].productPrice.toString(),
                                                 style: TextStyle(fontSize: 12,
                                                     fontWeight: FontWeight.bold),),
                                               SizedBox(height: 5),
                                               Align(alignment: Alignment.centerRight,
                                                 child: InkWell(
                                                   onTap: () {},
                                                   child: Container(
                                                     height: 35,
                                                     width: 100,
                                                     decoration: BoxDecoration(
                                                       color: Color(0xFF31906E).withOpacity(.9),
                                                       borderRadius: BorderRadius.circular(5),
                                                     ),
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(4.0),
                                                       child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           InkWell(
                                                               onTap: () {
                                                                 int quantity = snapshot.data![index].quantity!;
                                                                 int price = snapshot.data![index].initialPrice!;
                                                                 quantity--;
                                                                 int? newPrice = price *
                                                                     quantity;

                                                                 if (quantity > 0) {
                                                                   dbHelper!.updateQuantity(
                                                                       Cart(
                                                                         id: snapshot.data![index].id!,
                                                                         productId: snapshot.data![index].id!.toString(),
                                                                         productName: snapshot.data![index].productName!,
                                                                         initialPrice: snapshot.data![index].initialPrice!,
                                                                         productPrice: newPrice,
                                                                         quantity: quantity,
                                                                         unitTag: snapshot.data![index].unitTag.toString(),
                                                                         image: snapshot.data![index].image.toString(),)
                                                                   ).then((value) {
                                                                     newPrice = 0;
                                                                     quantity = 0;
                                                                     cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                   }).onError((
                                                                       error,
                                                                       stackTrace) {
                                                                     print(error.toString());
                                                                   });
                                                                 }
                                                               },
                                                               child: Center(
                                                                   child: Icon(Icons.remove, color: Colors.white,))),
                                                           Text(snapshot.data![index].quantity.toString(),
                                                             style: TextStyle(
                                                                 color: Colors.white),),
                                                           InkWell(
                                                               onTap: () {
                                                                 int quantity = snapshot.data![index].quantity!;
                                                                 int price = snapshot.data![index].initialPrice!;
                                                                 quantity++;
                                                                 int? newPrice = price *
                                                                     quantity;

                                                                 dbHelper!.updateQuantity(
                                                                     Cart(
                                                                       id: snapshot.data![index].id!,
                                                                       productId: snapshot.data![index].id!.toString(),
                                                                       productName: snapshot.data![index].productName!,
                                                                       initialPrice: snapshot.data![index].initialPrice!,
                                                                       productPrice: newPrice,
                                                                       quantity: quantity,
                                                                       unitTag: snapshot.data![index].unitTag.toString(),
                                                                       image: snapshot.data![index].image.toString(),)
                                                                 ).then((value) {
                                                                   newPrice = 0;
                                                                   quantity = 0;
                                                                   cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                 }).onError((error, stackTrace) {
                                                                   print(error.toString());
                                                                 });
                                                               },
                                                               child: Center(
                                                                   child: Icon(Icons.add, color: Colors.white,)))
                                                         ],),),),
                                                 ),)],)
                                       )
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           );
                         }
                     )
                 );
               }
             }
            return Text("");
           }),
           Consumer<CartProvider>(builder: (context, value, child){
             return Visibility(
               visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
               child: Center(
                 child: Column(
                   children: [
                     ReusableWidget(title: 'Sub Total', value: r'Rs. '+value.getTotalPrice().toStringAsFixed(2)),
                     ReusableWidget(title: 'Discout 5%', value: r'Rs. '+'',),
                     Divider(),
                     SizedBox(
                       height: 30,
                       child: ReusableWidget(title: 'Total', value: r'Rs. '+value.getTotalPrice().toStringAsFixed(2))),
                     ElevatedButton(
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Color(0xFF31906E).withOpacity(.9),),
                             minimumSize: MaterialStateProperty.all(Size(230, 50)),
                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(30.0),
                                 ))),
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                         },
                         child: Text("Confirm Order"))
                   ],
                 ),
               ),
             );
           })
         ],
       ),
     ),
   );
  }
}


class ReusableWidget extends StatelessWidget {
  final String title , value ;
  const ReusableWidget({required this.title,required this.value});
  
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title , style: Theme.of(context).textTheme.subtitle2,),
        Text(value.toString() , style: Theme.of(context).textTheme.subtitle2,),
        
      ],
    ),
  ) ;
  }
  
}