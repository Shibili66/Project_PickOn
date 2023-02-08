import 'package:flutter/material.dart';
import 'package:pick_on/screen/Slider_Menu/AboutUs.dart';
import 'package:pick_on/screen/Slider_Menu/MyOders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../PoroductCategory/Bakery_list/vegitabel_list/Myfavor.dart';
import '../First Main.dart';
import '../SignIn.dart';
import 'Myaddersses.dart';
import 'Myprofile.dart';

class slider extends StatefulWidget {
  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("PickOn.com"),
              accountEmail: Text("Huck123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile(),));
                  },
                  child: ClipOval(
                    child: Image.network(
                      "https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  image: DecorationImage(
                      image: AssetImage(
                          "asset/images/back23.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("My Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("My Addresses"),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Myadd(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("My Orders"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOders(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("My Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstmain(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("My Wishlist"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyfavorVG(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outlined),
              title: Text("About us"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
              });}
            ),
          ],
        ),

    );
  }
}