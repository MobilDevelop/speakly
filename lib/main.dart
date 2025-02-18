import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/appManager/app_manager_cubit.dart';
import 'package:speakly/application/home/home_bloc.dart';
import 'package:speakly/application/home/home_event.dart';
import 'package:speakly/application/main/main_bloc.dart';
import 'package:speakly/application/profile/profile_bloc.dart';
import 'package:speakly/application/progress/progress_bloc.dart';
import 'package:speakly/application/resources/resources_bloc.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/pages/app_widget.dart';
import 'infrastructure/common/app_init.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await runZonedGuarded<Future<void>>(() async {
  await initializeApp();

    runApp( 
      EasyLocalization(
        supportedLocales: const [Locale('ru')],
        useFallbackTranslations: true,
        useOnlyLangCode: true,
        fallbackLocale: const Locale('uz'),
        path: 'assets/translations',
        child: const MyApp(),
      ),
    ); 
  }, (error, stack) {});
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState() {
    super.initState();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppManagerCubit>(create: (context) => AppManagerCubit()..init()),
          BlocProvider<MainBloc>(create: (context) => MainBloc()),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()..add(HomeFirstEvent())),
          BlocProvider<ResourcesBloc>(create: (context) => ResourcesBloc()),
          BlocProvider<ProgressBloc>(create: (context) => ProgressBloc()),
          BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        ], 
        child: ScreenUtilInit(
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          splitScreenMode: true,
          builder: (context, child) => const AppWidget(),
      ),
    );
  }
}