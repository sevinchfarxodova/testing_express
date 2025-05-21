import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../languages/locale_keys.g.dart';
import 'day_button.dart';

class ShowStatisticsTwo extends StatefulWidget {
  const ShowStatisticsTwo({super.key});

  @override
  State<ShowStatisticsTwo> createState() => _ShowStatisticsTwoState();
}

class _ShowStatisticsTwoState extends State<ShowStatisticsTwo> {
  final ScrollController _scrollController = ScrollController();

  int _currentIndex = 0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    double offset = _scrollController.offset; // Scroll pixellarini oling
    double itemWidth = appW(305); // Har bir itemning kengligi
    int newIndex =
        (offset / itemWidth).round(); // Qaysi item ekanligini aniqlash
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.only(
            right: appW(7),
            left: appW(15),
          ),
          physics: const SlowScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: appW(305),
                height: appH(208),
                padding:
                    EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(20)),
                margin: EdgeInsets.only(right: appW(8)),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.training_days.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20.sp,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) {
                          return DayButton(isActive: index == 0);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.you_completed.tr(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 16.sp,
                              ),
                        ),
                        4.getW,
                        Text(
                          "15%",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 16.sp,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: appW(305),
                height: appH(208),
                padding:
                    EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(20)),
                margin: EdgeInsets.only(right: appH(8)),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.tests.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20.sp,
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: appW(10),
                        vertical: appH(8),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Тест играми",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.arrowRight,
                            width: appW(18),
                            height: appH(18),
                            colorFilter: ColorFilter.mode(
                              Colors.grey,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: appW(10),
                        vertical: appH(8),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Тест на C3",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.arrowRight,
                            width: appW(18),
                            height: appH(18),
                            colorFilter: ColorFilter.mode(
                              Colors.grey,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: appW(10),
                        vertical: appH(8),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Тест на C3",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.arrowRight,
                            width: appW(18),
                            height: appH(18),
                            colorFilter: ColorFilter.mode(
                              Colors.grey,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        15.getH,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 1),
                width: _currentIndex == index ? appW(34) : appW(4),
                height: appH(4),
                decoration: BoxDecoration(
                  color: AppColors.white
                      .withValues(alpha: _currentIndex == index ? 1 : 0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class SlowScrollPhysics extends ScrollPhysics {
  const SlowScrollPhysics({super.parent});

  @override
  SlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SlowScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * 0.6; // 0.6 = scroll tezligini 60% ga sekinslashtiradi
  }
}
