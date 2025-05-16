import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/colors/app_colors.dart';

class MyCashedNetwork extends StatelessWidget {
  const MyCashedNetwork({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
    this.width,
    this.height,
  });

  final String imageUrl;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          shape: boxShape,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.grey2,
          highlightColor: AppColors.grey1,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: boxShape,
              borderRadius: borderRadius,
              color: Colors.grey.shade300,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: boxShape,
            image: DecorationImage(
              image: AssetImage(
                AppImages.failedImagePng,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
