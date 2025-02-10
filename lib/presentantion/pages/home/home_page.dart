import 'package:speakly/presentantion/assets/theme/app_theme.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      body: Center(child: Text("Home page")),
    );
  }
}