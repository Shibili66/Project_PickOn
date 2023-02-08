import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/Cart.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Whishlist_provider/favpro.dart';
import '../../../Cart/Cart.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Cart/CartProvider.dart';


class MyfavorSL extends StatefulWidget{
  @override
  State<MyfavorSL> createState() => _MyfavorSLState();
}

class _MyfavorSLState extends State<MyfavorSL> {

  List<String> productName = ['Maths Box' ,  'Water Bottle' ,'Water Bottle' ,  'Note Book' ,'Pen' , 'Exam Pepper','Recod Book','Note Pad' , 'Note Book' , 'Long Note' , 'Pencil' , 'Pencil Box' , 'Pencil Box','Marker','Eraser','Eraser','Slate bord','School Bag','Bag','School Bag','HP Bag','School Bag','Water Bottle','Kids Bottle'] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per','per','per'] ;

  List<int> productPrice = [55,  65 ,59 , 40, 10 , 2 , 72, 30, 44 , 55 , 6 , 48, 58 , 60,5,3,30,595,358,490,550,520,43,50] ;

  List<String> productImage = [
    "asset/images/School_img/imgbin_abm-metal-tech-set-tool-geometry-box-png.png",
    "asset/images/School_img/kisspng-water-bottles-sports-energy-drinks-school-water-bottle-5b3361e8254358.1819515715300940561526.png",
    "asset/images/School_img/kisspng-water-bottles-glass-bottle-nalgene-plastic-bottle-school-water-bottle-5b2218b2dbcc72.4151741515289612029003.png",
    "asset/images/School_img/pngegg (4).png",
    "asset/images/School_img/pngegg (3).png",
    "asset/images/School_img/pngegg (5).png",
    "asset/images/School_img/pngegg (6).png",
    "asset/images/School_img/pngegg (7).png",
    "asset/images/School_img/pngegg (8).png",
    "asset/images/School_img/pngegg (9).png",
    "asset/images/School_img/pngegg (10).png",
    "asset/images/School_img/pngegg (11).png",
    "asset/images/School_img/pngegg (12).png",
    "asset/images/School_img/pngegg (13).png",
    "asset/images/School_img/pngegg (14).png",
    "asset/images/School_img/pngegg (15).png",
    "asset/images/School_img/pngegg (17).png",
    "asset/images/School_img/pngegg (18).png",
    "asset/images/School_img/pngegg (19).png",
    "asset/images/School_img/pngegg (20).png",
    "asset/images/School_img/pngegg (21).png",
    "asset/images/School_img/pngegg (23).png",
    "asset/images/School_img/pngwing.com (1).png",
    "asset/images/School_img/pngwing.com (2).png",
  ] ;



  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    final favor  = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Color(0xFF306754),)),
        backgroundColor:Colors.transparent,
        elevation: 0,
        title: const Center(child: Text("My Wishlist",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold,color: Color(0xFF306754)),)),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: favor.selectedItem.length,
              itemBuilder: (context, index){
                return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                  return Card(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              Image(
                                  width:100,
                                  height:100,
                                  image: AssetImage(productImage[index].toString())
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:65,left: 18),
                                child: Text(productName[index].toString(),
                                  style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:20,left: 120),
                                child: InkWell(
                                    onTap: (){

                                      if(value.selectedItem.contains(index)){
                                        value.removeItem(index);
                                      }else{
                                        value.removeItem(index);
                                      }
                                    },
                                    child: Icon(value.selectedItem.contains(index) ? Icons.favorite:Icons.favorite_border,color: Colors.red[900])
                                ),),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120,bottom: 10),
                            child: Text(productUnit[index].toString() +" "+r"Rs. "+ productPrice[index].toString(),
                              style: TextStyle(fontSize:12,fontWeight:FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                  );
                }

                );
              }
          ))
        ],
      ),
    );
  }
}