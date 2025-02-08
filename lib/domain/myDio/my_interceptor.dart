import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      EasyLoading.showInfo(err.response?.data['message']);
    }
    
    super.onError(err, handler);
  }

  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json'; 
    options.baseUrl = dotenv.env['mainUrl']!;
    super.onRequest(options, handler);
   }
}