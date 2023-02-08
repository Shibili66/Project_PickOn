
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:pick_on/Cart/Cart.dart';
import 'package:pick_on/Cart/CartProvider.dart';
import 'package:pick_on/Cart/db_Helper.dart';
import 'package:provider/provider.dart';

import '../../../Cart/Cart_screen.dart';
import '../../../Whishlist_provider/favpro.dart';

import '../../../screen/First Main.dart';
import '../../../screen/Slider_Menu/Myprofile.dart';
import '../../../screen/Slider_Menu/slider_menu.dart';
import 'Myfavor.dart';


class Beautypage extends StatefulWidget{



  @override
  State<Beautypage> createState() => _BeautypageState();
}

class _BeautypageState extends State<Beautypage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  List<int> selectedItem = [];
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
  List<String> productName = ['makeup set' , 'Shampoo ' , 'SEDA shampoo' , 'GOLD Lotion' , 'Dove Combo' , 'Sun Cream','Vaseline','NIVEA Cream' , 'EAUDE Parfum' , 'Parfum' , 'BOSS' , 'CH parfum' , 'Comb','Brush','Nice Brush','Mirror','Chain','Ring','Nail Polish','Face Wash','Wash Gel','Round Comb'] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per'] ;

  List<int> productPrice = [95, 99 , 88 , 145 ,186, 130 , 135, 152, 229 , 199 , 299 , 310, 20 , 35,38,200,140,105,85,190,185,89] ;

  List<String> productImage = [
    "asset/images/beauty2_img/beauty_img/pngegg (3).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (11).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (12).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (13).png",
    "asset/images/beauty2_img/beauty_img/pngwing.com (14).png",
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavor()));
                        },
                        child: Icon(Icons.home,size: 24,)),
                    text: "home",
                  ),
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavor()));
                        },
                        child: Icon(Icons.favorite,size: 24,)),text: "Favorite",),
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Beautypage()));
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
