import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/colors/app_colors.dart';

class CostumeCachedNetworkImage extends StatelessWidget {
  const CostumeCachedNetworkImage({super.key, this.borderRadius, this.margin});

  final BorderRadius? borderRadius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://static3.depositphotos.com/1007646/223/i/450/depositphotos_2237342-stock-photo-sierra-nevada-highway.jpg",
      imageBuilder: (context, imageProvider) => Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: borderRadius,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
