import 'package:flutter/material.dart';
import 'package:restici_admin/core/app_themes/text_style/app_text_style.dart';
import 'package:restici_admin/core/widgets/main_widgets/app_text.dart';
import 'package:restici_admin/core/widgets/package_widgets/app_svg_image.dart';

/// TODO COLORS

class AppHeaderTitle extends StatelessWidget {
  const AppHeaderTitle({
    super.key,
    required this.title,
    this.svgIconPath,
    this.trailing,
    this.textStyle,
  }) : seeMore = false,
       iconOnPress = null;

  const AppHeaderTitle.seeMore({
    super.key,
    required this.title,
    this.svgIconPath,
    this.trailing,
    this.textStyle,
    this.iconOnPress,
  }) : seeMore = true;

  final String title;
  final String? svgIconPath;
  final TextStyle? textStyle;
  final bool seeMore;
  final Widget? trailing;
  final void Function()? iconOnPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: svgIconPath != null,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: AppSvgImage(path: svgIconPath ?? ''),
          ),
        ),
        AppText(title, ),
      ],
    );
  }
}
