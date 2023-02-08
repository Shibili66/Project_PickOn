import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_on/screen/Slider_Menu/slider_menu.dart';

class MyProfile extends StatefulWidget{
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xFF31906E).withOpacity(.9),
         title: Text("My Profile"),
         leading: InkWell(
           onTap: () {
             Navigator.pop(context);
           },
           child: Icon(
             Icons.arrow_back,
             color: Colors.white,
           ),
         ),
       ),
       body: Container(
         child: Padding(
           padding: const EdgeInsets.only(left:15,top:25,right: 15),
           child: GestureDetector(
             onTap: (){
               FocusScope.of(context).unfocus();
             },
             child: ListView(
               children: [
                 Center(
                   child: Stack(
                     children: [
                       Container(
                         width: 130,
                         height: 130,
                         decoration: BoxDecoration(
                           border: Border.all(width: 4,color: Colors.white),
                           boxShadow: [
                             BoxShadow(
                               spreadRadius: 2,
                               blurRadius: 10,
                               color: Colors.black.withOpacity(0.1)
                             )
                           ],
                           shape: BoxShape.circle,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage("https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000")
                           )
                         ),
                       ),
                       Positioned(
                         bottom: 0,
                           right: 0,
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border: Border.all(
                                 width: 4,
                                 color: Colors.white,
                               ),
                               color:Color(0xFF31906E).withOpacity(.9),
                             ),
                             child: Icon(
                               Icons.edit,
                               color: Colors.white,
                             ),
                           )
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 20,),
                 buildTextField("Name","Huck",false),
                 buildTextField("Email","Huck@gmail.com",false),
                 buildTextField("Password","********",true),
                 buildTextField("Location","Kannur",false),
                 SizedBox(height: 30),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     OutlinedButton(
                         onPressed: (){},
                         child: Text("CANCEL",style: TextStyle(
                           fontSize: 15,
                           letterSpacing: 2,
                           color: Colors.black
                         ),),
                       style: OutlinedButton.styleFrom(
                         backgroundColor: Colors.white70,
                         padding:  EdgeInsets.symmetric(horizontal: 30),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 8),
                       child: ElevatedButton(
                           onPressed: (){},
                           child: Text("SAVE",style: TextStyle(fontSize: 15,
                           letterSpacing: 2,
                             color: Colors.white
                           ),),
                       style: ElevatedButton.styleFrom(
                         primary: Color(0xFF31906E).withOpacity(.9),
                           padding:  EdgeInsets.symmetric(horizontal: 40),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                       ),
                       ),
                     )
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
     ),
   );
  }

  Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText:  isPasswordTextField ? isObscurePassword :false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(
                icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                  onPressed: () {}, ):null,
              contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey
        )
        ),
      ),
    );
  }
}
