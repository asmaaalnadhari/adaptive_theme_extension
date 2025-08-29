import 'package:flutter/material.dart';
import 'package:theme_extension_example/theme/responsive_util.dart';

/// Extensions for ergonomic usage in widgets.
extension ResponsiveExtensions on num {

  /// Scale for font sizes with clamping.
  double sp(BuildContext context) =>
      ResponsiveUtil.scaleFont(context, toDouble());
}
