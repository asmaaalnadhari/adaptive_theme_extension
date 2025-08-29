// lib/theme/app_colors.dart
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color onSurface;
  final Color background;
  final Color onBackground;
  final Color error;
  final Color onError;

  final Color textPrimary;
  final Color textSecondary;
  final Color divider;
  final Color success;
  final Color warning;
  final Color info;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.success,
    required this.warning,
    required this.info,
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      divider: divider ?? this.divider,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color _l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      primary: _l(primary, other.primary),
      onPrimary: _l(onPrimary, other.onPrimary),
      secondary: _l(secondary, other.secondary),
      onSecondary: _l(onSecondary, other.onSecondary),
      surface: _l(surface, other.surface),
      onSurface: _l(onSurface, other.onSurface),
      background: _l(background, other.background),
      onBackground: _l(onBackground, other.onBackground),
      error: _l(error, other.error),
      onError: _l(onError, other.onError),
      textPrimary: _l(textPrimary, other.textPrimary),
      textSecondary: _l(textSecondary, other.textSecondary),
      divider: _l(divider, other.divider),
      success: _l(success, other.success),
      warning: _l(warning, other.warning),
      info: _l(info, other.info),
    );
  }
}
