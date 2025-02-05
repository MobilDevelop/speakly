// import 'package:gap/gap.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

// class DropDown extends StatelessWidget {
//   const DropDown({
//     super.key,
//     required this.messengers,
//     required this.selectMessengers, required this.title, required this.onChanged, required this.errorBorder, this.type, this.search,
//   });
//   final Function onChanged;
//   final List<Universal> messengers;
//   final Universal? selectMessengers;
//   final String title;
//   final bool errorBorder;
//   final String? type;
//   final String? search;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(" $title",style: AppTheme.data.textTheme.caption!.copyWith(color: AppTheme.colors.grey)),
//         Gap(ScreenSize.h4),
//         DropdownSearch<Universal>(
//           mode: type==null?Mode.DIALOG:Mode.MENU,
//           items: messengers,
//           showClearButton: true,
//           showSearchBox: search!=null?true:false,
//           selectedItem: selectMessengers,
//           dropdownBuilder: (context, selectedItem) => Container(
//             height: ScreenSize.h35,
//             width: double.maxFinite,
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.only(left: ScreenSize.w5,top: ScreenSize.h2),
//             child: Text(selectedItem!=null?selectedItem.title:"-",
//             style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500)),
//           ),
//           popupItemBuilder: (context, item, isSelected) => Container(
//             height: ScreenSize.h35,
//             width: double.maxFinite,
//             padding: EdgeInsets.only(left: ScreenSize.w8),
//             alignment: Alignment.centerLeft,
//             color: item.id == selectMessengers?.id?AppTheme.colors.white:AppTheme.colors.white,
//             child: Text(item.title,
//             style:AppTheme.data.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,color: item.id == selectMessengers?.id?AppTheme.colors.primary:AppTheme.colors.black))),
//           itemAsString: (Universal? item) => item!=null?item.title:"",
//           popupShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(ScreenSize.r8)),
//           maxHeight: messengers.length>10? null:messengers.length*ScreenSize.h35,
//           onChanged: (value) => onChanged(value),
//           dropdownSearchDecoration: InputDecoration(
//             contentPadding: EdgeInsets.only(left: ScreenSize.w5),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(ScreenSize.r8),
//               borderSide: BorderSide(color: errorBorder?AppTheme.colors.red:AppTheme.colors.primary, width: ScreenSize.h1)),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(ScreenSize.r8),
//               borderSide: BorderSide(color: errorBorder?AppTheme.colors.red:AppTheme.colors.grey1,width: ScreenSize.h1),
//             )
//           ),
//         ),
//         Visibility(
//           visible: errorBorder,
//           child: Column(
//             children: [
//               Gap(ScreenSize.h3),
//               Text(tr("To'ldirish majburiy"),style: AppTheme.data.textTheme.bodySmall!.copyWith(fontSize: ScreenSize.sp7,color: AppTheme.colors.red))
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
