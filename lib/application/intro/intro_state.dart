import 'package:speakly/presentantion/routes/index_routes.dart';

abstract class IntroState {}

 class IntroInitial extends IntroState {
   final int index;
   final PageController pagecontroller;

  IntroInitial({this.index =0,PageController? pagecontroller}):
  pagecontroller = pagecontroller ?? PageController();

   IntroInitial copyWith({int? index,PageController? pagecontroller})=>IntroInitial(
    index: index ?? this.index,
    pagecontroller: pagecontroller?? this.pagecontroller,
   );
 
 }

 class IntroNextAuth extends IntroState{
  
 }
