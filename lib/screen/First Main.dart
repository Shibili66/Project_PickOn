

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_on/screen/AuthProvider.dart';
import 'package:pick_on/screen/Slider_Menu/slider_menu.dart';
import 'package:pick_on/PoroductCategory/Bakery_list/vegitabel_list/vegitable_page_final.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../PoroductCategory/Bakery_list/Bakery_page/Bakery.dart';
import '../PoroductCategory/Bakery_list/Beauty_list/Beauty_page.dart';
import '../Cart/Cart_screen.dart';
import '../PoroductCategory/Bakery_list/FoodGrains_list/FoodGrains_page.dart';
import '../PoroductCategory/Bakery_list/Fruits_list/Fruits_page.dart';
import '../PoroductCategory/Bakery_list/HomeAccesoris_list/HomeAccesoris_page.dart';
import '../PoroductCategory/Bakery_list/School_list/School_page.dart';
import '../PoroductCategory/Bakery_list/Sports_list/Sports_page.dart';
import 'Splash.dart';
import 'package:google_fonts/google_fonts.dart';

class Firstmain extends StatefulWidget{
  const Firstmain({Key? key,}) : super(key: key);

  @override
  State<Firstmain> createState() => _FirstmainState();
}
var scaffoldKey = GlobalKey<ScaffoldState>();

class _FirstmainState extends State<Firstmain> {

  @override
  Widget build(BuildContext context) {
  return StreamBuilder<User?>(
    stream: context.watch<AuthProvider>().stream(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return Splash();
      return WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.grey[200],
            drawer: slider(),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu,color:  Color(0xFF31906E),), onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
              },
              ),
              backgroundColor:Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(right:50),
                child:Text("Pick On",style: GoogleFonts.lilitaOne(textStyle: TextStyle(color: Color(0xFF31906E)),fontSize: 35)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right:18),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartscreen(),));
                      },
                     child: Icon(Icons.shopping_cart,color: Color(0xFF31906E))),
                )
              ],
            ),
            body:SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CarouselSlider(items: [
                            InkWell(
                              onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>vegitablepage(),));
                        },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("asset/images/helth.jpg",),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bakerypage(),));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("asset/images/bakery.jpg",),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeacces_page(),));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("asset/images/halloooooo.png",),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Schoolpage(),));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("asset/images/back-school-sale-banner-with-colorful-pencil-text-written-with-chalk-chalkboard_1314-2517.png",),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                          ], options: CarouselOptions(
                            height: 300,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayCurve: Curves.decelerate,
                            aspectRatio: 16 / 9,
                            autoPlayAnimationDuration: Duration(milliseconds: 600),
                            viewportFraction: 0.8,
                            enableInfiniteScroll: true,
                          ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 44,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.10)
                          ),
                          child: const TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "serach product",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search_rounded,color: Colors.black38,)
                            ),
                          ),
                        ),
                      ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>vegitablepage()));
                                   },
                                   child: Container(
                                    height: 90,
                                    width: MediaQuery.of(context).size.width*0.456,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.green[300],
                                        ),
                                          child: Wrap(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:17,left: 8),
                                                  child: Text("VEGETABLE",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 60),
                                                  child: SizedBox(
                                                      width: 150,
                                                      child: Image.asset("asset/images/toppng.com-vegetables-images-png-vegetables-1911x1320.png")),
                                                ),
                                              ],
                                            ),
                                          ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(7.0),
                                   child: InkWell(
                                     onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Fruitspage()));
                                     },
                                     child: Container(
                                        height: 90,
                                        width: MediaQuery.of(context).size.width*0.459,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xFFFF6347).withOpacity(.9),
                                        ),
                                       child: Wrap(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(top:13,left: 10),
                                             child: Text("FRUITS",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(left:60),
                                             child: SizedBox(
                                                 width: 150,
                                                 child: Image.asset("asset/images/PngItem_1215316.png")),
                                           ),
                                         ],
                                       ),
                                ),
                                   ),
                                 ),
                            ],
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodGrainspage()));
                              },
                              child: Container(
                                height: 90,
                                width: MediaQuery.of(context).size.width*0.456,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orangeAccent[400],
                                ),
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:13,left: 8),
                                      child: Text("FOODGRAINS\n & MASALA",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35,),
                                      child: SizedBox(
                                          width: 160,
                                          child: Image.asset("asset/images/abcdef.png")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bakerypage()));
                                },
                                child: Container(
                                  height: 90,
                                  width: MediaQuery.of(context).size.width*0.459,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.purple[200],
                                  ),
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:13,left: 10),
                                        child: Text("BAKERY & DAIRY",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:55),
                                        child: SizedBox(
                                            width: 150,
                                            child: Image.asset("asset/images/bakeryeee.png")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Schoolpage()));
                              },
                              child: Container(
                                height: 90,
                                width:  MediaQuery.of(context).size.width*0.456,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.pinkAccent[200],
                                ),
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:13,left: 8),
                                      child: Text("SCHOOL",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:60,),
                                      child: SizedBox(
                                          width: 160,
                                          child: Image.asset("asset/images/clipart1506622.png")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeacces_page()));
                                },
                                child: Container(
                                  height: 90,
                                  width: MediaQuery.of(context).size.width*0.459,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue[200],
                                  ),
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:13,left: 10),
                                        child: Text("HOME ACCESSORIES",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:90),
                                        child: SizedBox(
                                            width: 150,
                                            child: Image.asset("asset/images/bucat.png")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Beautypage()));
                              },
                              child: Container(
                                height: 90,
                                width: MediaQuery.of(context).size.width*0.456,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.brown[200],
                                ),
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:13,left: 8),
                                      child: Text("BEAUTY & HYGING",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35,),
                                      child: SizedBox(
                                          width: 160,
                                          child: Image.asset("asset/images/buaty.png")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sportspage()));
                                },
                                child: Container(
                                  height: 90,
                                  width: MediaQuery.of(context).size.width*0.459,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber[300],
                                  ),
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:13,left: 10),
                                        child: Text("SPORTS",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:25),
                                        child: SizedBox(
                                            width: 160,
                                            child: Image.asset("asset/images/Sports.png")),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ),
      );
    }
  );
  }

 Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Really ??"),
            content: Text("Do you want to close the app ?"),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                Navigator.of(context).pop(false);
              },
                  child: Text("No")),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes")),
            ],
          );
        }
    );
    return exitApp ?? false;
 }

}


