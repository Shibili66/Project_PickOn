
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:pick_on/Cart/Cart.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import 'package:pick_on/Cart/db_Helper.dart';
import 'package:pick_on/screen/First%20Main.dart';
import 'package:provider/provider.dart';

import '../../../Cart/Cart_screen.dart';
import '../../../Whishlist_provider/favpro.dart';

import '../../../screen/Slider_Menu/Myprofile.dart';
import '../../../screen/Slider_Menu/slider_menu.dart';

import 'Myfavor.dart';

class FoodGrainspage extends StatefulWidget{



  @override
  State<FoodGrainspage> createState() => _FoodGrainspageState();
}

class _FoodGrainspageState extends State<FoodGrainspage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
  List<String> productName = ['Wheat ' , 'Ghee Rice' , 'Brown Rice' , 'Rice(Pacheri)' , 'Maida' , 'Whole WheatAtta','Kuruva Rice','Garam Masala' , 'Chili Powder' , 'Read Chili Powder' , 'Chiken Masala' , 'Basmati Rice 5kg', 'Basmati Rice 2kg','Biryani Rice 5kg+2kg','Atta 1kg','Atta 1kg','Suger'] ;

  List<String> productUnit = ['KG' , 'KG' , 'KG' , 'KG' , 'KG' , 'KG','KG', 'Per' , 'Per' , 'Per' , 'Per' , 'per','Per','Per','pre','per','KG'] ;

  List<int> productPrice = [29, 89 , 47 , 31 , 49, 40 , 44, 38, 33, 34 ,46, 459 ,210,465,55,51,40] ;

  List<String> productImage = [
    "asset/images/Foodgrains_img/5a35cbb2e3a743.9002739915134749949325.png",
    "asset/images/Foodgrains_img/kisspng-sake-rice-box-packaging-and-labeling-food-rice-5a81853b3f2047.1598822915184376912586.png",
    "asset/images/Foodgrains_img/kisspng-rice-cereal-bag-food-rice-sacks-5a891652931d68.7961993115189335866026.png",
    "asset/images/Foodgrains_img/kisspng-rice-biryani-pilaf-grocery-store-basmati-rice-sacks-5a86f56b030de2.2499074915187940910125.png",
    "asset/images/Foodgrains_img/kisspng-atta-flour-maida-flour-bakery-bread-5b097413b38b21.7893089115273461957354.png",
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
    return  SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pop(context);},
              child: Icon(Icons.arrow_back,color: Color(0xFF31906E))),
          backgroundColor:Colors.transparent,
          elevation: 0,
          title: Container(
            height: 44,
            width: 240,
            child: const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "serach product",
                  prefixIcon: Icon(
                    Icons.search_rounded,color: Colors.black38,)
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: productName.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Consumer<FavouriteItemProvider>(builder: (context,value,child){
                      return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                          width:100,
                                          height:100,
                                          image: AssetImage(productImage[index].toString())
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:30,left: 20),
                                        child: InkWell(
                                            onTap: (){

                                              if(value.selectedItem.contains(index)){
                                                value.removeItem(index);
                                              }else{
                                                value.addItem(index);
                                              }
                                            },
                                            child: Icon(value.selectedItem.contains(index) ? Icons.favorite:Icons.favorite_border,color: Colors.red[900])
                                        ),)
                                    ],
                                  ),
                                  Text(productName[index].toString(),
                                    style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:2,left: 8),
                                    child: Text(productUnit[index].toString() +" "+r"Rs. "+ productPrice[index].toString(),
                                      style: TextStyle(fontSize:12,fontWeight:FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: (){
                                        dbHelper!.insert(
                                            Cart(
                                                id: index,
                                                productId: index.toString(),
                                                productName: productName[index].toString(),
                                                initialPrice: productPrice[index],
                                                productPrice: productPrice[index],
                                                quantity: 1,
                                                unitTag: productUnit[index].toString(),
                                                image: productImage[index].toString())
                                        ).then((value){
                                          print("Product is added to cart");
                                          cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                          cart.addCounter();
                                        }).onError((error, stackTrace){
                                          print(error.toString());
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:33,top: 8),
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color:Color(0xFF31906E).withOpacity(.9),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text("Add to cart",style:TextStyle(color:Colors.white),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      );
                    }

                    ),
                  );
                }
            ))
          ],
        ),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(50)
            ),
            child: Container(
              color: Color(0xFF306754),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white70,
                labelStyle: TextStyle(fontSize: 10),
                indicatorColor: Colors.black54,
                tabs: <Widget>[
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstmain()));
                        },
                        child: Icon(Icons.home,size: 24,)),
                    text: "home",
                  ),
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyfavorFD()));
                        },
                        child: Icon(Icons.favorite,size: 24,)),text: "Favorite",),
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodGrainspage()));
                        },
                        child: Icon(Icons.category,size: 24,)),
                    text: "Category",
                  ),
                  Tab(
                    icon: Badge(
                        badgeContent:Consumer<CartProvider>(
                          builder: (context, value, child){
                            return Text(value.getCounter().toString(),style: TextStyle(color:Colors.white),);
                          },
                        ),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartscreen()));
                            },
                            child: Icon(Icons.shopping_cart,size: 24,))),
                    text: "Cart",
                  ),
                  Tab(
                    icon: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile(),));
                        },
                        child: Icon(Icons.manage_accounts_rounded,size: 24,)),
                    text: "Profil",
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

