import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Whishlist_provider/favpro.dart';



class MyfavorHM extends StatefulWidget{
  @override
  State<MyfavorHM> createState() => _MyfavorHMState();
}

class _MyfavorHMState extends State<MyfavorHM> {

  List<String> productName = ['Broom' ,  'Mop Combo' ,'Long Broom' ,  'Hand Brash' ,'Mop' , 'Harpic Ultra','Cleaning kit','Vanish' , 'Vanish SP' , 'Clorox' , 'Dust Pan' , 'Sponch' , 'Pur','Ariel 5kg','Tide 3kg','Surf Excel','OMO 500g','Joy','OMO Lq','Palmolive','Tide Lq','Lifebuoy','Lifebuoy','AROMA','Dinner set','Dinner set','Salt Bottle','Spoon','Tea Cup'] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per','per','per' , 'per' , 'per','per','per','per',] ;

  List<int> productPrice = [100, 300 , 140 ,  58,180 , 80 ,499, 70, 80 , 130 , 105 , 15, 68 ,299,189,104,75,71,99,115,120,35,88,92,690,595,80,68,165] ;

  List<String> productImage = [
    "asset/images/Homeass_img/pngfind.com-broom-png-285820.png",
    "asset/images/Homeass_img/pngfind.com-mop-bucket-png-4741206.png",
    "asset/images/Homeass_img/pngfind.com-broom-png-287027.png",
    "asset/images/Homeass_img/pngfind.com-red-paint-stroke-png-1293936.png",
    "asset/images/Homeass_img/pngfind.com-mop-png-1534158.png",
    "asset/images/Homeass_img/pngwing.com (1).png",
    "asset/images/Homeass_img/pngwing.com (2).png",
    "asset/images/Homeass_img/pngwing.com (3).png",
    "asset/images/Homeass_img/pngwing.com (4).png",
    "asset/images/Homeass_img/pngwing.com (5).png",
    "asset/images/Homeass_img/pngwing.com (6).png",
    "asset/images/Homeass_img/pngwing.com (7).png",
    "asset/images/Homeass_img/pngwing.com (8).png",
    "asset/images/Homeass_img/pngwing.com (9).png",
    'asset/images/Homeass_img/pngwing.com (10).png',
    'asset/images/Homeass_img/pngwing.com (11).png',
    'asset/images/Homeass_img/pngwing.com (12).png',
    'asset/images/Homeass_img/pngwing.com (13).png',
    'asset/images/Homeass_img/pngwing.com (14).png',
    'asset/images/Homeass_img/pngwing.com (15).png',
    'asset/images/Homeass_img/pngwing.com (16).png',
    'asset/images/Homeass_img/pngwing.com (17).png',
    'asset/images/Homeass_img/pngwing.com (18).png',
    'asset/images/Homeass_img/pngwing.com (19).png',
    'asset/images/Homeass_img/toppng.com-crockery-dinner-set-34-pcs-fancy-dinner-set-1102x723.png',
    'asset/images/Homeass_img/toppng.com-dinner-plate-png-transparent-images-dinner-set-png-transparent-2329x1238.png',
    'asset/images/Homeass_img/toppng.com-empty-salt-and-pepper-set-250x250.png',
    'asset/images/Homeass_img/toppng.com-knife-fork-spoon-1200x1200.png',
    'asset/images/Homeass_img/toppng.com-porcelain-tea-cup-978x978.png',



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