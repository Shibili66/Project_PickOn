import 'package:flutter/material.dart';
import 'package:pick_on/screen/AuthProvider.dart';

import 'package:pick_on/screen/First%20Main.dart';
import 'package:pick_on/screen/Splash.dart';
import 'package:pick_on/screen/signIn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'Cart/CartProvider.dart';
import 'Whishlist_provider/favpro.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (BuildContext context){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
              ChangeNotifierProvider(create: (_) => AuthProvider(FirebaseAuth.instance)),
              StreamProvider(create: (context) => context.watch<AuthProvider>().stream(),
                  initialData: null)
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:Firstmain(),
            ),
          );
        }),
      );
    }
  }