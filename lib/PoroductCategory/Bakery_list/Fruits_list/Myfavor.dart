import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Whishlist_provider/favpro.dart';


class MyfavorFS extends StatefulWidget{
  @override
  State<MyfavorFS> createState() => _MyfavorFSState();
}

class _MyfavorFSState extends State<MyfavorFS> {

  List<String> productName = ['Apple' ,  'Grapes' ,'Custard Apple' ,  'Pear' ,'Kiwi' , 'Mango','pineapple','Plum' , 'Water Melon' , 'Guava' , 'Strawberry' , 'Sapodilla' , 'Roman','Banana',] ;

  List<String> productUnit = ['KG' , 'KG' , 'KG' , 'KG' , 'KG' , 'KG','KG','KG' , 'KG' , 'KG' , 'KG' , 'KG' , 'KG','KG',] ;

  List<int> productPrice = [140,  70 ,80 , 55 ,90, 85 , 70, 68, 88 , 29 , 56 , 53, 60 , 54,] ;

  List<String> productImage = [
    "asset/images/Fruits_img/apple.png",
    "asset/images/Fruits_img/grapes.png",
    "asset/images/Fruits_img/custard-apple.png",
    "asset/images/Fruits_img/kisspng-asian-pear-stock-photography-olive-oil-fruit-pear-5ab4a703284486.840222381521788675165.png",
    "asset/images/Fruits_img/kiwi.png",
    "asset/images/Fruits_img/mango.png",
    "asset/images/Fruits_img/pineapple.png",
    "asset/images/Fruits_img/plum.png",
    "asset/images/Fruits_img/pngegg (4).png",
    "asset/images/Fruits_img/pngegg (5).png",
    "asset/images/Fruits_img/pngegg (6).png",
    "asset/images/Fruits_img/pngegg (7).png",
    "asset/images/Fruits_img/pomegranate.png",
    "asset/images/Fruits_img/toppng.com-bunch-of-bananas-1810x1429.png",


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