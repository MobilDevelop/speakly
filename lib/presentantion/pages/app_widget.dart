import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:speakly/application/appManager/app_manager_cubit.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/components/error_view.dart';
import 'package:speakly/presentantion/routes/coordinator.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      if (state is AppManagerLoading) {
        return const CircularProgressIndicator();
      } else if (state is AppManagerError) {
        return ErrorView(error: state.error);
      } else {
        return RequestsInspector(
          showInspectorOn: ShowInspectorOn.LongPress,
          enabled: false,
          hideInspectorBanner: true,
          child: MaterialApp.router(
            title: 'Speakly',
            theme: AppTheme.data,
            themeMode: AppTheme.themeMode,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
            builder: EasyLoading.init()
          ),
        );
      }
    });
  }
}
