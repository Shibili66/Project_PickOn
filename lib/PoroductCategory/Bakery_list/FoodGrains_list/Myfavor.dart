import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pick_on/Cart/Cart.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import '../../../Whishlist_provider/favpro.dart';
import '../../../Cart/Cart.dart';
import '../../../Cart/db_Helper.dart';
import '../../../Cart/CartProvider.dart';


class MyfavorFD extends StatefulWidget{
  @override
  State<MyfavorFD> createState() => _MyfavorFDState();
}

class _MyfavorFDState extends State<MyfavorFD> {

  List<String> productName = ['Wheat ',  'Ghee Rice' ,'Brown Rice' ,  'Maida' ,'Rice(Pacheri)' , 'Whole WheatAtta','Kuruva Rice','Garam Masala' , 'Chili Powder' , 'Read Chili Powder' , 'Chiken Masala' , 'Basmati Rice 5kg', 'Basmati Rice 2kg','Biryani Rice 5kg+2kg','Atta 1kg','Atta 1kg','Suger'] ;

  List<String> productUnit = ['KG' , 'KG' , 'KG' , 'KG' , 'KG' , 'KG','KG', 'Per' , 'Per' , 'Per' , 'Per' , 'per','Per','Per','pre','per','KG'] ;

  List<int> productPrice = [29, 89 , 47 ,  49,31 , 40 , 44, 38, 33, 34 ,46, 459 ,210,465,55,51,40] ;

  List<String> productImage = [
    "asset/images/Foodgrains_img/5a35cbb2e3a743.9002739915134749949325.png",
    "asset/images/Foodgrains_img/kisspng-rice-cereal-bag-food-rice-sacks-5a891652931d68.7961993115189335866026.png",
    "asset/images/Foodgrains_img/kisspng-sake-rice-box-packaging-and-labeling-food-rice-5a81853b3f2047.1598822915184376912586.png",
    "asset/images/Foodgrains_img/kisspng-atta-flour-maida-flour-bakery-bread-5b097413b38b21.7893089115273461957354.png",
    "asset/images/Foodgrains_img/kisspng-rice-biryani-pilaf-grocery-store-basmati-rice-sacks-5a86f56b030de2.2499074915187940910125.png",
    "asset/images/Foodgrains_img/kisspng-atta-flour-patanjali-ayurved-grocery-store-ghee-5b0821438f0733.0864152215272594595859.png",
    "asset/images/Foodgrains_img/kisspng-bag-rice-gunny-sack-hessian-fabric-jute-rice-sacks-5a84f7e8dd5d53.5136436915186636569067.png",
    "asset/images/Foodgrains_img/ginni-pure-garam-masala-powder-400gms-pack-of-2-product-images-orvwbwiabwb-p591714813-0-202205292258.png",
    "asset/images/Foodgrains_img/imgbin_chili-powder-indian-cuisine-chana-masala-chili-con-carne-flavor-png.png",
    "asset/images/Foodgrains_img/imgbin_chili-powder-indian-cuisine-chili-con-carne-chicken-tikka-masala-chili-pepper-png.png",
    "asset/images/Foodgrains_img/pngwing.com (1).png",
    "asset/images/Foodgrains_img/pngwing.com (2).png",
    "asset/images/Foodgrains_img/pngwing.com (5).png",
    "asset/images/Foodgrains_img/pngwing.com (6).png",
    "asset/images/Foodgrains_img/pngwing.com (7).png",
    "asset/images/Foodgrains_img/pngwing.com (8).png",
    "asset/images/Foodgrains_img/toppng.com-sugar-png-327x264.png",

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