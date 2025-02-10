import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({
    super.key, required this.image1, required this.image2,
  });
  final String image1;
  final String image2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 150.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: ScreenSize.h6),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              border: Border.all(color: AppTheme.colors.greysoft),
              borderRadius: BorderRadius.circular(ScreenSize.r12),
              boxShadow: [
               BoxShadow(
                color: AppTheme.colors.black.withOpacity(.1),
                blurRadius: ScreenSize.h4,
                spreadRadius: ScreenSize.h1,
                offset: Offset(ScreenSize.h4, ScreenSize.h3)
                )
              ]
            ),
            child: Image.asset(image1,fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Container(
            height: 150.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: ScreenSize.h6),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              border: Border.all(color: AppTheme.colors.greysoft),
              borderRadius: BorderRadius.circular(ScreenSize.r12),
              boxShadow: [
               BoxShadow(
                color: AppTheme.colors.black.withOpacity(.1),
                blurRadius: ScreenSize.h4,
                spreadRadius: ScreenSize.h1,
                offset: Offset(ScreenSize.h4, ScreenSize.h3)
                )
              ]
            ),
            child: Image.asset(image2,fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}