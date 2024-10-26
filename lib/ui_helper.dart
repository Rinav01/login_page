import 'package:flutter/material.dart';

class UiHelper{
  static customTextField(TextEditingController controller , String text, IconData iconData,bool toHide){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
      ),
    );
  }
  static customButton(VoidCallback voidCallback , String text,BuildContext context){
    return SizedBox(height: 30,width: 300,child: ElevatedButton(onPressed: (){
      voidCallback();
    }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25)
    ),backgroundColor: Theme.of(context).colorScheme.primary),
        child: Text(text,style: const TextStyle(color: Colors.black,fontSize: 20),)));
  }

  static customAlertDialog(BuildContext context , String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
      );
    });
  }

}