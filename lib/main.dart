import 'package:covid_app/datasource.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(MaterialApp(
    //disables the debug banner top right
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryBlack
    ),
    home: HomePage()
  ));
}