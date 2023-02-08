import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Whishlist_provider/favpro.dart';


class MyfavorVG extends StatefulWidget{
  @override
  State<MyfavorVG> createState() => _MyfavorVGState();
}

class _MyfavorVGState extends State<MyfavorVG> {

  List<String> productName = ['Tomato' , 'Potato' , 'Peas' , 'Ladyfinger' , 'Ginger' , 'Garlic','Drumstick','Cucumber' , 'Cauliflower' , 'Capsicum' , 'Brinjal' , 'Beetroot' , 'Beans','Ash Gourd',"Chilli"] ;

  List<String> productUnit = ['KG' , 'KG' , 'KG' , 'KG' , 'KG' , 'KG','KG','KG' , 'KG' , 'KG' , 'KG','KG' , 'KG' , 'KG','KG',] ;

  List<int> productPrice = [25, 30 , 38 , 40 , 40, 80 , 70, 30, 90 , 50 , 42 , 47, 44 , 68,59] ;

  List<String> productImage = [
    "asset/images/vegitabel_img/tomato.png",
    "asset/images/vegitabel_img/potato.png",
    "asset/images/vegitabel_img/peas.png",
    "asset/images/vegitabel_img/ladyfinger.png",
    "asset/images/vegitabel_img/ginger.png",
    "asset/images/vegitabel_img/garlic.png",
    "asset/images/vegitabel_img/drumstick.png",
    "asset/images/vegitabel_img/cucumber.png",
    "asset/images/vegitabel_img/cauliflower.png",
    "asset/images/vegitabel_img/capsicum.png",
    "asset/images/vegitabel_img/brinjal.png",
    "asset/images/vegitabel_img/beetroot.png",
    "asset/images/vegitabel_img/beans.png",
    "asset/images/vegitabel_img/ash-gourd.png",
    "asset/images/vegitabel_img/3c425a418d2c6b4670ee7d47c799a80d.png",

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