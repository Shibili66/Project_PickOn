
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
import 'Myfavor.dart';

class Homeacces_page extends StatefulWidget{



  @override
  State<Homeacces_page> createState() => _Homeacces_pageState();
}

class _Homeacces_pageState extends State<Homeacces_page> with SingleTickerProviderStateMixin{
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

  List<String> productName = ['Broom' , 'Long Broom' , 'Mop Combo' , 'Mop' , 'Hand Brash' , 'Harpic Ultra','Cleaning kit','Vanish' , 'Vanish SP' , 'Clorox' , 'Dust Pan' , 'Sponch' , 'Pur','Ariel 5kg','Tide 3kg','Surf Excel','OMO 500g','Joy','OMO Lq','Palmolive','Tide Lq','Lifebuoy','Lifebuoy','AROMA','Dinner set','Dinner set','Salt Bottle','Spoon','Tea Cup'] ;

  List<String> productUnit = ['per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per' , 'per' , 'per' , 'per' , 'per' , 'per','per','per','per','per' , 'per' , 'per','per','per','per',] ;

  List<int> productPrice = [100, 140 , 300 , 180 , 58, 80 ,499, 70, 80 , 130 , 105 , 15, 68 ,299,189,104,75,71,99,115,120,35,88,92,690,595,80,68,165] ;

  List<String> productImage = [
    "asset/images/Homeass_img/pngfind.com-broom-png-285820.png",
    "asset/images/Homeass_img/pngfind.com-broom-png-287027.png",
    "asset/images/Homeass_img/pngfind.com-mop-bucket-png-4741206.png",
    "asset/images/Homeass_img/pngfind.com-mop-png-1534158.png",
    "asset/images/Homeass_img/pngfind.com-red-paint-stroke-png-1293936.png",
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
    return  SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pop(context);},
              child: Icon(Icons.arrow_back,color: Color(0xFF31906E))),
          backgroundColor: Colors.transparent,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyfavorHM()));
                        },
                        child: Icon(Icons.favorite,size: 24,)),text: "Favorite",),
                  Tab(
                    icon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeacces_page()));
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

