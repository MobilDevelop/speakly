import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speakly/application/welcome/welcome_cubit.dart';
import 'package:speakly/application/welcome/welcome_state.dart';
import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/pages/welcome/components/welcome_first.dart';
import 'package:speakly/presentantion/pages/welcome/components/welcome_second.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      body: BlocProvider(
        create: (context) => WelcomeCubit(),
        child: Stack(
          children: [
            BlocBuilder<WelcomeCubit, WelcomeState>(
              builder: (context, state) {
                if (state is WelcomeFirst) {
                  return WelcomeFirstView(
                    press: () => context.read<WelcomeCubit>().nextSecond(),
                  );
                }
                return Container();
              },
            ),
            BlocBuilder<WelcomeCubit, WelcomeState>(
              builder: (context, state) {
                if (state is WelcomeSecend) {
                  return WelcomeSecondView(
                    index: state.index,
                    press: (index) => context.read<WelcomeCubit>().selectItem(index),
                    successPress: ()=>context.go(Routes.main.path),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
