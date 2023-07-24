import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 CustomButton({Key? key,this.text,this.ontap}) : super(key: key);
 String? text;
 VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
         height: 50,width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(child: Text(text!,style: TextStyle(fontSize: 20,),)),
      ),
    );
  }
}

