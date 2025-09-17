import 'package:flutter/widgets.dart';
import 'screen_size.dart';

/// General-purpose scaler: use for dimensions, font sizes, etc.
class ResponsiveUtil {
  /// Computes a scale factor based on the device width vs. design width.
  static double scaleFactor(BuildContext context) {
    final bucket = getScreenSize(context);
    // Logger.log('Screen Type is : ${bucket.threshold}');
    final deviceW = MediaQuery.sizeOf(context).width;
    final designW = bucket.threshold;
    return deviceW / designW;
  }

  /// Scales any numeric value (e.g., widths, heights) by the scale factor.
  static double scale(BuildContext context, double value) {
    return value * scaleFactor(context);
  }

  /// Scales font sizes and clamps them within ±20% of the original.
  static double scaleFont(BuildContext context, double fontSize) {
    final factor = scaleFactor(context);
    final scaled = fontSize * factor;
    final minSize = fontSize * 0.8;
    final maxSize = fontSize * 1.2;
    return scaled.clamp(minSize, maxSize);
  }

  /// Get the current screen size bucket
  static ScreenSize getCurrentScreenSize(BuildContext context) {
    return getScreenSize(context);
  }

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return getScreenSize(context) == ScreenSize.small ||
        getScreenSize(context) == ScreenSize.normal;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    return getScreenSize(context) == ScreenSize.large;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return getScreenSize(context) == ScreenSize.extraLarge;
  }
}

