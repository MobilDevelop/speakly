
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Localizationchecker{
  static changeLanguage(BuildContext context,int type){
    if(type == 1){
      EasyLocalization.of(context)!.setLocale(const Locale("uz"));
    }else if(type == 2){
      EasyLocalization.of(context)!.setLocale(const Locale("ru"));
    }
  }
}