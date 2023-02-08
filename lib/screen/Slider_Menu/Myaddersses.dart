import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myadd extends StatelessWidget {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF31906E).withOpacity(.9),
          title: Text("My Address"),
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
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.my_location,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Use Current Location",style: TextStyle(color: Colors.blue),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  buildTextField("  Full Name","    Huck jon",false),
                  buildTextField("  Address line 1'","    Address 1",false),
                  buildTextField("  Address line 2","   Address 2",false),
                  buildTextField("  Home name,city","   abc,Kannur",false),
                  buildTextField("  Pin code","   670592",false),
                  buildTextField("  Phone Number","   7848256494",false),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("  SAVE  ",style: TextStyle(fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF31906E).withOpacity(.9),
                            padding:  EdgeInsets.symmetric(horizontal: 40),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      )
                    ]
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
      child: TextFormField(

        obscureText:  isPasswordTextField ? isObscurePassword :false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
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
