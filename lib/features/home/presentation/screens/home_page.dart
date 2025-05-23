import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/widget/header_widget.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/local_source/storage_repository.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../widget/classes_for_today_view.dart';
import '../widget/show_statistics.dart';
import '../widget/test_section_widget.dart';
import '../widget/training_days_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Token: ${StorageRepository.getString(key: "access_token")}");

    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appW(15)),
                child: HeaderWidget(
                  onTap: () {
                    NavigationService.instance.pushNamed(
                      routeName: AppRoutesNames.profile,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.getH,
                      ShowStatistics(),
                      20.getH,
                      ClassesForTodayView(),
                      20.getH,
                      TrainingDaysView(),
                      20.getH,
                      TestSectionWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
