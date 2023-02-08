import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/Cart.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Whishlist_provider/favpro.dart';
import '../../../Cart/Cart.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Cart/CartProvider.dart';



class Myfavor extends StatefulWidget{
  @override
  State<Myfavor> createState() => _MyfavorState();
}

class _MyfavorState extends State<Myfavor> {

  List<String> productName = ['makeup set' ,  'SEDA shampoo' ,'Shampoo ' , 'Dove Combo' , 'GOLD Lotion' , 'Sun Cream','Vaseline','NIVEA Cream' , 'EAUDE Parfum' , 'Parfum' , 'BOSS' , 'CH parfum' , 'Comb','Brush','Nice Brush','Mirror','Chain','Ring','Nail Polish','Face Wash','Wash Gel','Round Comb'] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per'] ;

  List<int> productPrice = [95, 88 , 99 ,186, 145 , 130 , 135, 152, 229 , 199 , 299 , 310, 20 , 35,38,200,140,105,85,190,185,89] ;

  List<String> productImage = [
    "asset/images/beauty2_img/beauty_img/pngegg (3).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (12).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (11).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (14).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (13).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (15).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (16).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (17).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (18).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (19).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (20).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (21).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (22).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (1).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (2).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (3).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (4).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (5).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (6).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (7).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (8).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (24).png",
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