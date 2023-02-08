import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:pick_on/Cart/Cart.dart';

class DBHelper {
  static Database? _db2 ;

  Future<Database?> get db2 async {
    if (_db2 != null) {
      return _db2!;
    }

    _db2 = await initDatabase();
    return null;
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , "cart.db");
    var db = await openDatabase(path, version: 1,onCreate: _onCreate,);
    return db;
  }

  _onCreate(Database db , int version )async{
    await db.execute(
        ('CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT,initialPrice INTEGER, productPrice INTEGER , quantity INTEGER, unitTag TEXT , image TEXT )')
    );
  }
  Future<Cart> insert(Cart cart)async{
    var dbClient = await db2 ;
    await dbClient!.insert('cart', cart.toMap());
    return cart;

  }
  Future<List<Cart>> getCartList()async{
    var dbClient = await db2 ;
   final List<Map<String, Object?>> queryResult= await dbClient!.query('cart');
   return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db2;
    return await dbClient!.delete(
        'cart',
            where: 'id = ?',
         whereArgs: [id]
    );
  }
  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db2;
    return await dbClient!.update(
        'cart',
        cart.toMap(),
        where: 'id = ?',
        whereArgs: [cart.id]
    );
  }
}