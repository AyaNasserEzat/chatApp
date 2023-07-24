import 'package:flutter/material.dart';
class CustomFormTextfield extends StatelessWidget {
   CustomFormTextfield ({Key? key,this.hintText,this.onchange}) : super(key: key);
  String? hintText;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if(data!.isEmpty)
          return 'feild is required';
      },
      onChanged: onchange,
      decoration:InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )
      ) ,
    );
  }
}

