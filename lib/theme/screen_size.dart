import 'package:flutter/material.dart';

/// Defines screen-size buckets based on device width thresholds.
enum ScreenSize {
  small(360),
  normal(392),
  large(600),
  extraLarge(1364);

  final double threshold;
  const ScreenSize(this.threshold);
}

/// Returns the [ScreenSize] bucket for the current device.
ScreenSize getScreenSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= ScreenSize.extraLarge.threshold) return ScreenSize.extraLarge;
  if (width >= ScreenSize.large.threshold)      return ScreenSize.large;
  if (width >= ScreenSize.normal.threshold)     return ScreenSize.normal;
  return ScreenSize.small;
}
