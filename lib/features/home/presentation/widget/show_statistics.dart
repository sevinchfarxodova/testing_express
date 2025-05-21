import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
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
      width: double.infinity, // ✅ Fixed width: previously 0
      height: appH(150),
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
                margin: EdgeInsets.symmetric(horizontal: appW(15)),
                borderRadius: BorderRadius.circular(20.r),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: appW(20),
                  vertical: appH(15),
                ),
                margin: EdgeInsets.symmetric(horizontal: appW(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.55),
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
                                ?.copyWith(fontSize: 16.sp),
                          ),
                          8.getH,
                          // ✅ Removed invalid width: 0 * 0.4.w
                          RichText(
                            text: TextSpan(
                              text: LocaleKeys.you_complete.tr(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontSize: 16.sp),
                              children: [
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(fontSize: 22.sp),
                                ),
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
                          8.getH,
                          SvgPicture.asset(
                            AppIcons.homeSmile,
                            width: appW(45),
                            height: appH(45),
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
              children: List.generate(2, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 1, bottom: appH(10)),
                  width: _activeIndex == index ? appW(34) : appW(4),
                  height: appH(4),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(
                      _activeIndex == index ? 1 : 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                );
              }),
            ),
          ),
          if (_activeIndex < 1)
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: _goToNextPage,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: appH(15), right: appW(20)),
                  width: appW(48),
                  height: appH(48),
                  decoration: BoxDecoration(
                    color: AppColors.c054649,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.arrowRight,
                    width: appW(18),
                    height: appH(18),
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
