import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/extension/size_extension.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../languages/locale_keys.g.dart';
import 'costume_cached_network_image.dart';

class ShowStatistics extends StatefulWidget {
  const ShowStatistics({super.key});

  @override
  State<ShowStatistics> createState() => _ShowStatisticsState();
}

class _ShowStatisticsState extends State<ShowStatistics> {
  int _activeIndex = 0;
  final PageController _pageController = PageController();

  void _goToNextPage() {
    if (_pageController.hasClients) {
      _activeIndex++;
      setState(() {});
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 150.he,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (v) {
              setState(() {
                _activeIndex = v;
              });
            },
            children: [
              CostumeCachedNetworkImage(
                margin: EdgeInsets.symmetric(horizontal: 15.we),
                borderRadius: BorderRadius.circular(20.r),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.we,
                  vertical: 15.he,
                ),
                margin: EdgeInsets.symmetric(horizontal: 15.we),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.55),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.your_statistics.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                ),
                          ),
                          8.getH(),
                          SizedBox(
                            width: width * 0.4.w,
                            child: RichText(
                              text: TextSpan(
                                text: LocaleKeys.you_complete.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                children: [
                                  TextSpan(
                                      text: " ",
                                      style: TextStyle(fontSize: 22.sp)),
                                  TextSpan(
                                    text: "75%",
                                    style: AppTextStyle.nunitoMedium.copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.c2DC937,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.great.tr(),
                            style: AppTextStyle.nunitoMedium.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.c2DC937,
                            ),
                          ),
                          8.getH(),
                          SvgPicture.asset(
                            AppIcons.homeSmile,
                            width: 45.we,
                            height: 45.we,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(
                      right: 1.we,
                      bottom: 10.he,
                    ),
                    width: _activeIndex == index ? 34.we : 4.we,
                    height: 4.he,
                    decoration: BoxDecoration(
                      color: AppColors.white
                          .withValues(alpha: _activeIndex == index ? 1 : 0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                },
              ),
            ),
          ),
          if (_activeIndex < 1)
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: _goToNextPage,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    bottom: 15.he,
                    right: 20.we,
                  ),
                  width: 48.we,
                  height: 48.we,
                  decoration: BoxDecoration(
                    color: AppColors.c054649,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.arrowRight,
                    width: 18.we,
                    height: 18.we,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
