import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Whishlist_provider/favpro.dart';



class MyfavorSP extends StatefulWidget{
  @override
  State<MyfavorSP> createState() => _MyfavorSPState();
}

class _MyfavorSPState extends State<MyfavorSP> {

  List<String> productName = ['Basket Ball' , 'Shattle bat' , 'Shattle bat' , 'Single Bat' , 'Cricket Bat' , 'Ludo','Cricket ball','Ludo','Jersey','Ball' , 'Food Ball' , 'Boot' , 'Runing Shoue' , 'Boot' , 'Boot AL',] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' ,] ;

  List<int> productPrice = [320, 140 , 220 , 110 , 360, 80 , 90, 100, 190 , 50 , 340 , 450, 460 , 490,550] ;

  List<String> productImage = [
    "asset/images/Sports_img/5a2219c1eda709.3093102215121842579734.png",
    "asset/images/Sports_img/clipart304661.png",
    "asset/images/Sports_img/clipart305586.png",
    "asset/images/Sports_img/clipart1115980.png",
    "asset/images/Sports_img/clipart1487229.png",
    "asset/images/Sports_img/clipart1716114.png",
    "asset/images/Sports_img/clipart2873555.png",
    "asset/images/Sports_img/clipart4316903.png",
    "asset/images/Sports_img/imgbin_2016-17-manchester-city-f-c-season-premier-league-nike-factory-store-png.png",
    "asset/images/Sports_img/kisspng-beach-ball-beach-ball-5a74c4aba133b5.6378308515176019636603.png",
    "asset/images/Sports_img/pngegg (4).png",
    "asset/images/Sports_img/pngegg (5).png",
    "asset/images/Sports_img/pngegg (6).png",
    "asset/images/Sports_img/pngegg (7).png",
    "asset/images/Sports_img/pngegg (8).png",
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