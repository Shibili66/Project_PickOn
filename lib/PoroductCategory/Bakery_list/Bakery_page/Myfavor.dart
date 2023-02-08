import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Whishlist_provider/favpro.dart';



class MyfavorBk extends StatefulWidget{
  @override
  State<MyfavorBk> createState() => _MyfavorBkState();
}

class _MyfavorBkState extends State<MyfavorBk> {

  List<String> productName = ['Doughnut' ,  'Cake' ,'Butter Cookies' , 'Nutella 250g' ,'Cake black' , 'Peanut Butter','Cup Cake','Shawarma' , 'Pizza' , 'Pizza 250g' , 'Burger' , 'Pringles' , 'Pringles Red','Good Day','Sprite','Fanta','Coca Cola','Lays','Lays','m&m`s','OREO','Kinder','Kit Kat','Twix','Snickers'] ;

  List<String> productUnit = ['per' , 'kg' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per','per','per'] ;

  List<int> productPrice = [25,  190 ,100 ,  210,230 , 190 ,200, 60, 130 , 140 , 95 , 109, 109 , 30,55,55,60,45,50,85,25,25,25,30,35] ;

  List<String> productImage = [
    "asset/images/Bakery_img/Bakery_img/pngegg (6).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (5).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (7).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (3).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (4).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (9).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (8).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (28).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (29).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (30).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (27).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (26).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (25).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (24).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (23).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (22).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (21).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (20).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (19).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (18).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (17).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (14).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (13).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (12).png",
    "asset/images/Bakery_img/Bakery_img/pngegg (11).png",

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