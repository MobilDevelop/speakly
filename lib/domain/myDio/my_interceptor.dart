import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speakly/infrastructure/local_source/local_source.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';

class MyInterceptor extends Interceptor{
  MyInterceptor();
 
  @override
  void onError(DioException err, ErrorInterceptorHandler handler)async{
      if (err.response?.statusCode == 401) {
      // LocalSource.clearProfile();
      //EasyLoading.showInfo(err.response?.data['message']);
     //EasyLoading.showInfo("token eskirib qoldi");
    //  UserInfo info = await LoginService().getUsarInfo();

    // if(info.id!=-1){
    //   LocalSource.putInfo(key: "bearerToken", json: info.token);
    //   await Future.delayed(const Duration(milliseconds: 600));
    //   }
    }else{
      Fluttertoast.showToast(
       msg: err.response?.data['message'],
       toastLength: Toast.LENGTH_SHORT, // Toast muddati
       gravity: ToastGravity.CENTER, // Toast joylashuvi
       backgroundColor: AppTheme.colors.red, // Orqa fon rangi
       textColor: AppTheme.colors.white, // Matn rangi
       fontSize: 14.sp,
       );
    }
    
    super.onError(err, handler);
  }

  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = await LocalSource.getInfo(key: "token");
    options.baseUrl = dotenv.env['mainUrl']!;
    super.onRequest(options, handler);
   }
}