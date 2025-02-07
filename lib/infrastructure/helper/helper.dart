import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  static String dateFormat(DateTime? date){
      return date==null?"": DateFormat('dd.MM.yyyy').format(date);
  }

  static bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}


  static String toProcessCost(String value) {
    if (value == '0' || value.isEmpty) {
      return '0';
    }

    String valueRealPart = '';
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.')+1, value.length);
      value = value.substring(0, value.indexOf('.')); 
    }
    String count = '';
    String partCount = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = '${value.substring(i - 1, i)} $count';
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }

    if(valueRealPart.isNotEmpty){
      double valuePartNumber = double.parse(valueRealPart);

    if(valuePartNumber==0.0){
      partCount = "";
    }else{
      while (valuePartNumber>1) {
        valuePartNumber = valuePartNumber/10;
      }
     partCount = ".${(valuePartNumber*10).round()}";
    } 
    }
    
    return count+partCount;
  }

}