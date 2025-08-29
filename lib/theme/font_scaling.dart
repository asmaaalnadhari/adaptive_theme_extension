import 'package:adaptive_theme_extension/theme/responsive_util.dart';
import 'package:flutter/material.dart';

/// Extensions for ergonomic usage in widgets.
extension ResponsiveExtensions on num {

  /// Scale for font sizes with clamping.
  double sp(BuildContext context) =>
      ResponsiveUtil.scaleFont(context, toDouble());
}
