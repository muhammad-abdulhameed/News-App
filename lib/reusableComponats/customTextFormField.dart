

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key, required this.prefixIcon,required this.hint,required this.controller,this.maxLine=1,required this.onChange});
String prefixIcon;
String hint;
Function onChange;

TextEditingController controller;

int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
onChanged:(value){
  onChange();
} ,
      maxLines: maxLine,

controller: controller,

      decoration: InputDecoration(

        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        filled: true,
        prefixIcon:Padding(padding: EdgeInsets.symmetric(horizontal: 16,),
            child: SvgPicture.asset(prefixIcon)),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 24,
          minHeight: 24
        ),



        hintText: hint,

      ),
    );
  }
}
