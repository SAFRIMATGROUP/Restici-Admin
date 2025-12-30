import 'package:flutter/material.dart';
import 'package:restici_admin/core/utils/app_assets.dart';
import 'package:restici_admin/core/utils/extensions.dart';
import 'package:restici_admin/core/widgets/package_widgets/app_svg_image.dart';

class AppPopIcon extends StatelessWidget {
  const AppPopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: Transform.rotate(
        angle: context.isArabic ? 3.14 : 0,
        child: const AppSvgImage(path: AppAsset.arrowBackIcon),
      ),
    );
  }
}
