import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import '../Cart/Cart.dart';
import '../Cart/db_Helper.dart';
import '../Cart/CartProvider.dart';


class Wishlist extends StatefulWidget{
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Color(0xFF306754).withOpacity(.9),
        title: const Center(child: Text("My Wishlist123",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),)),
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
                                                   ],)
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
          ],
        ),
      ),
    );
  }
}