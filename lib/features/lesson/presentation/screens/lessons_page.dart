// import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/global/widget/custom_btn_widget.dart';
// import '../../../../core/global/widget/header_widget.dart';
// import '../../../../core/global/widget/main_background.dart';
// import '../../../../core/styles/app_text_style.dart';
// import '../bloc/get_task_bloc/get_task_bloc.dart';
// import '../bloc/get_task_bloc/get_task_state.dart';
// import '../bloc/home_event.dart';
//
// class TaskPage extends StatefulWidget {
//   final String userId;
//
//   const TaskPage({super.key, required this.userId});
//
//   @override
//   State<TaskPage> createState() => _TaskPageState();
// }
//
// class _TaskPageState extends State<TaskPage> {
//   String _currentLanguage = 'uz';
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<GetTaskBloc>().add(GetTaskEvent());
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _currentLanguage = context.locale.languageCode;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MainBackground(
//         child: BlocBuilder<GetTaskBloc, GetTaskState>(
//           builder: (context, state) {
//
//             if (state is GetTaskLoading) {
//               return const Center(child: CupertinoActivityIndicator());
//             }
//             if (state is GetTaskSuccess) {
//               final task = state.dailyTaskEntity;
//
//               return SafeArea(
//                 bottom: false,
//                 child: Column(
//                   children: [
//                     HeaderWidget(
//                       onTap: () {},
//                       onTapBack: () => Navigator.pop(context),
//                     ),
//                     10.getH,
//                     Expanded(
//                       child: ListView(
//                         padding: EdgeInsets.symmetric(horizontal: appW(15)),
//                         children: [
//                           if (task[""])
//                             Container(
//                               height: appH(20),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade300,
//                                 borderRadius: BorderRadius.circular(16.r),
//                               ),
//                               child: const Center(
//                                 child: Icon(Icons.play_circle, size: 50),
//                               ),
//                             ),
//                           20.getH,
//                           Text(
//                             'Darslar',
//                             style: AppTextStyle.nunitoBold.copyWith(
//                               fontSize: 20.sp,
//                             ),
//                           ),
//                           ...task.dailyTasks.map(
//                             (lesson) => Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 6),
//                               child: Text(
//                                 lesson.,
//                                 style: AppTextStyle.nunitoRegular.copyWith(
//                                   fontSize: 16.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           20.getH,
//                           Text(
//                             'Testlar soni: ${task.tests}',
//                             style: AppTextStyle.nunitoBold.copyWith(
//                               fontSize: 16.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: appW(15)),
//                       child: CustomBtnWidget(
//                         btnText: 'Закончил',
//                         onTap: () {
//                           // mark as complete or go to next
//                         },
//                       ),
//                     ),
//                     20.getH,
//                   ],
//                 ),
//               );
//             }
//
//             if (state is GetTaskError) {
//               return Center(
//                 child: Text(
//                   state.error,
//                   style: AppTextStyle.nunitoMedium.copyWith(color: Colors.red),
//                 ),
//               );
//             }
//
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//   }
// }
