import 'package:speakly/infrastructure/models/home/home_info.dart';

abstract class HomeState {
  final bool loading;
  
  HomeState({this.loading = true});
}
 
 class HomeInitial extends HomeState {
  final HomeInfo info;
   
   HomeInitial({HomeInfo? info,super.loading}):info = info ?? HomeInfo.fromJson({});

   HomeInitial copyWith({HomeInfo? info,bool? loading})=>HomeInitial(
    info: info ?? this.info,
    loading: loading?? this.loading,
   );
 }
