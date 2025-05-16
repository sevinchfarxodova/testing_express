import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_images.dart';
import 'my_cashed_network_image.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    super.key,
    this.xFile,
    this.imageUrl = "",
  });

  final XFile? xFile;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (xFile != null) {
      return Container(
        width: 125.w,
        height: 125.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(
              File(xFile!.path),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    if (imageUrl.isNotEmpty) {
      return MyCashedNetwork(
        width: 125.w,
        height: 125.w,
        imageUrl: imageUrl,
        boxShape: BoxShape.circle,
      );
    }
    return Container(
      width: 125.w,
      height: 125.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            AppImages.noImageProfile,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
