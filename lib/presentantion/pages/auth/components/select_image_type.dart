import 'package:bounce/bounce.dart';
import 'package:gap/gap.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/presentantion/assets/asset_index.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

class SelectImageType extends StatelessWidget {
  const SelectImageType({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Column(
        children: [
          Gap(ScreenSize.h8),
              Container(
               height: ScreenSize.h3,
               width: ScreenSize.h50,
                decoration: BoxDecoration(
                 color: AppTheme.colors.grey1,
                   borderRadius: BorderRadius.circular(ScreenSize.r5)
              ),
            ),

      Gap(ScreenSize.h16),
      Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap:(){
              context.pop(1);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h5),
              decoration: BoxDecoration(
                color: AppTheme.colors.primary.withOpacity(.5),
                border: Border.all(color: AppTheme.colors.primary),
                borderRadius: BorderRadius.circular(ScreenSize.r10)
              ),
              child: Column(
                children: [
                  Icon(Icons.image_outlined,size: ScreenSize.h30),
                  Text("Galareya")
                ],
              ),
            ),
          ),

          Bounce(
            duration: Duration(milliseconds: AppContatants.duration),
            onTap:(){
              context.pop(2);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12,vertical: ScreenSize.h5),
              decoration: BoxDecoration(
                color: AppTheme.colors.primary.withOpacity(.5),
                border: Border.all(color: AppTheme.colors.primary),
                borderRadius: BorderRadius.circular(ScreenSize.r10)
              ),
              child: Column(
                children: [
                  Icon(Icons.camera_alt_outlined,size: ScreenSize.h30),
                  Text("Kemara")
                ],
              ),
            ),
          ) 
         ],
          )  
        ],
      ),
    );
  }
}