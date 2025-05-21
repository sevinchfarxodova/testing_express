import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/local_source/storage_repository.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../languages/locale_keys.g.dart';
import '../../../lesson/presentation/bloc/get_task_bloc/get_task_bloc.dart';
import '../../../lesson/presentation/bloc/get_task_bloc/get_task_state.dart';
import '../../../lesson/presentation/bloc/home_event.dart';
import 'classes_for_today_item.dart';

class ClassesForTodayView extends StatefulWidget {
  const ClassesForTodayView({super.key});

  @override
  State<ClassesForTodayView> createState() => _ClassesForTodayViewState();
}

class _ClassesForTodayViewState extends State<ClassesForTodayView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<GetTaskBloc>().add(GetTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appW(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.clickHand,
                width: appW(38),
                height: appH(38),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              6.getW,
              Expanded(
                child: Text(
                  LocaleKeys.classes_for_today.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22.sp),
                ),
              ),
            ],
          ),
          15.getH,

          /// BlocBuilder for dynamic task list
          BlocBuilder<GetTaskBloc, GetTaskState>(
            builder: (context, state) {
              if (state is GetTaskLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetTaskSuccess) {
                final tasks = state.dailyTaskEntity.dailyTasks;

                return Column(
                  children: List.generate(
                    tasks.length,
                        (index) {
                      final task = tasks[index];

                      return ClassesForTodayItem(
                        name: task.subscription,
                        onTab: () {
                          setState(() {
                            _currentIndex = index;
                          });

                          final userId = StorageRepository.getString(key: "user_id");

                          Navigator.pushNamed(
                            context,
                            AppRoutesNames.lesson,
                            arguments: {
                              "userId": userId,
                              "lessonIndex": index,
                              "task": task, // optionally pass full task object
                            },
                          );
                        },
                        isShowBottomLiner: index != tasks.length - 1,
                        isActive: index == _currentIndex,
                      );
                    },
                  ),
                );
              }

              if (state is GetTaskError) {
                return Center(
                  child: Text(
                    state.error,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
