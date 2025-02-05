import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String test = dotenv.env['testAdd']!; 


  static String appVersion = '1.0.0';

  static int duration = 400;
}

