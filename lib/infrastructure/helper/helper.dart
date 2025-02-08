import 'dart:io';
import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';

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

  static String timeFormat(int time){
    if(time==120){
      return "2:00";
    }else if(time>60){
      if(time-60<10) return "1:0${time-60}";
      
      return "1:${time-60}";
    } else if(time==60){
      return "1:00";
    } else if(time<60){
       if(time<10) return "0:0$time";
      
       return "0:$time";
    }else if(time == 0){
      return "Resend code";
    }
    return "";
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

  Stream<int> timerStream(int startTime) async* {
    for (int i = startTime; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source, imageQuality: 30);
    if (image != null) {
      File rotatedImage = await FlutterExifRotation.rotateImage(path: image.path);
      return XFile(rotatedImage.path); //Return the file
    }
    return image;
  }

}