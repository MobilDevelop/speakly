import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/main/main_bloc.dart';
import 'package:speakly/application/main/main_event.dart';
import 'package:speakly/application/main/main_state.dart';
import 'package:speakly/presentantion/pages/home/home_page.dart';
import 'package:speakly/presentantion/pages/profile/profile_page.dart';
import 'package:speakly/presentantion/pages/progress/progress_page.dart';
import 'package:speakly/presentantion/pages/resources/resources_page.dart';

import 'components/bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
              children: [
              state.index == 0? HomePage():
              state.index == 1? ResourcesPage():
              state.index == 2? ProgressPage():
              state.index == 3? ProfilePage():
                      Container(),

              BottomBar(
                index: state.index,
                ontap: (index)=>context.read<MainBloc>().add(MainBottomItem(index: index)),
              )
              ],
            );
        },
      );
  }
}