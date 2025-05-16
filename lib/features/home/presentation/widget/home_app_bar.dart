// import 'package:express_test/constants/app_icons.dart';
// import 'package:express_test/core/extension/size_extension.dart';
// import 'package:express_test/core/routes/app_routes.dart';
// import 'package:express_test/core/routes/navigation_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.we),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           GestureDetector(
//             onTap: () {
//               NavigationService.instance.navigateMyScreen(
//                 routeName: AppRoutesNames.profile,
//               );
//             },
//             child: Row(
//               children: [
//                 Text(
//                   "Хатамов Н",
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontSize: 19.sp,
//                       ),
//                 ),
//                 5.getW(),
//                 SvgPicture.asset(
//                   AppIcons.profileUser,
//                   colorFilter: ColorFilter.mode(
//                     Theme.of(context).colorScheme.onPrimary,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
