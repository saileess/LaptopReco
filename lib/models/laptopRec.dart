import 'package:flutter/material.dart';

class LaptopRec {

  String laptopName = '';
  String laptopRam = '';
  int laptopPrice = 0;
  String laptopImage = '';
  String laptopMemory = '';
  String laptopType = '';
  String laptopOS = '';

  LaptopRec({this.laptopName, this.laptopRam, this.laptopPrice,
      this.laptopImage, this.laptopMemory, this.laptopType, this.laptopOS});

// LaptopRec({ this.laptopDesc, this.laptopImage, this.laptopMemory, this.laptopName, this.laptopOS });


  static ValueNotifier<String> lPrice = ValueNotifier('');
  static ValueNotifier<String> lType = ValueNotifier('');
  static ValueNotifier<String> lMemory = ValueNotifier('');
  static ValueNotifier<String> lOs = ValueNotifier('');



}


