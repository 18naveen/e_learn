

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant{
  static Widget h1(text){
    return  Text(text,style: GoogleFonts.roboto(
        textStyle:const TextStyle(fontSize: 29,fontWeight: FontWeight.w800)
    ),);

  }
  static Widget h2(text){
    return  Text(text,style: GoogleFonts.roboto(
        textStyle:const TextStyle(fontSize: 23,fontWeight: FontWeight.w800)
    ),);

  }
  static Widget t2(text){
    return  Text(text,style: GoogleFonts.roboto(
        textStyle:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)
    ),);

  }
  static Widget st3(text){
    return  Text(text,style: GoogleFonts.roboto(
        textStyle:const TextStyle(fontSize: 15,color:Colors.grey,fontWeight: FontWeight.w300)
    ),);

  }
  static Widget st4(text){
    return  Text(text,style: GoogleFonts.roboto(
        textStyle:const TextStyle(fontSize: 15,fontWeight: FontWeight.w400)
    ),);

  }

}