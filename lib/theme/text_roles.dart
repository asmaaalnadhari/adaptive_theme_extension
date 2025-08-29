import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'typography_tokens.dart';
import 'font_scaling.dart';


/// Small helper that composes TextStyles from tokens + colors
/// without reading Theme.of(context) during Theme construction.
class ComponentRoleStyles {
  ComponentRoleStyles({
    required this.colors,
    required this.tokens,
    required this.buildContext,
  });

  final AppColors colors;
  final AppTypographyTokens tokens;
  final BuildContext buildContext;

  // ----------- Body -----------
  TextStyle get bodySmallTextStyle => TextStyle(
    color: colors.textSecondary,
    fontSize: tokens.bodySmall.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get bodyMediumTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.bodyMedium.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get bodyLargeTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.bodyLarge.sp(buildContext),
    height: tokens.lineHeight,
  );

  // ----------- Titles -----------
  TextStyle get titleSmallTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.titleSmall.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  TextStyle get titleMediumTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.titleMedium.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  TextStyle get titleLargeTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.titleLarge.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w700,
  );

  // ----------- Headlines / Display -----------
  TextStyle get headlineSmallTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.headlineSmall.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  TextStyle get headlineMediumTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.headlineMedium.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w700,
  );

  TextStyle get headlineLargeTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.headlineLarge.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w800,
  );

  TextStyle get displaySmallTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.displaySmall.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.bold,
  );

  TextStyle get displayMediumTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.displayMedium.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.bold,
  );

  TextStyle get displayLargeTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.displayLarge.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.bold,
  );

  // ----------- Labels / Buttons -----------
  TextStyle get labelSmallTextStyle => TextStyle(
    color: colors.textSecondary,
    fontSize: tokens.labelSmall.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get labelMediumTextStyle => TextStyle(
    color: colors.textSecondary,
    fontSize: tokens.labelMedium.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get labelLargeTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.labelLarge.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get buttonTextStyle => TextStyle(
    color: colors.onPrimary,
    fontSize: tokens.buttonText.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  // ----------- Navigation / Special -----------
  TextStyle get navigationTitleTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.navigationTitle.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  TextStyle get navigationLargeTitleTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.navigationLargeTitle.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.bold,
  );

  TextStyle get actionTextStyle => TextStyle(
    color: colors.primary,
    fontSize: tokens.actionText.sp(buildContext),
    height: tokens.lineHeight,
    fontWeight: FontWeight.w600,
  );

  TextStyle get pickerTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.pickerText.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get dateTimePickerTextStyle => TextStyle(
    color: colors.textPrimary,
    fontSize: tokens.dateTimePickerText.sp(buildContext),
    height: tokens.lineHeight,
  );

  TextStyle get captionTextStyle => TextStyle(
    color: colors.textSecondary,
    fontSize: tokens.caption.sp(buildContext),
    height: tokens.lineHeight,
  );
}


/*

extension AppTextStyles on BuildContext {
  AppColors get _c => Theme.of(this).extension<AppColors>()!;
  AppTypographyTokens get _t => Theme.of(this).extension<AppTypographyTokens>()!;

  // Body
  TextStyle get bodySmall  => TextStyle(color: _c.textSecondary, fontSize: _t.bodySmall.sp(this),  height: _t.lineHeight);
  TextStyle get bodyMedium => TextStyle(color: _c.textPrimary,  fontSize: _t.bodyMedium.sp(this), height: _t.lineHeight);
  TextStyle get bodyLarge  => TextStyle(color: _c.textPrimary,  fontSize: _t.bodyLarge.sp(this),  height: _t.lineHeight);

  // Titles
  TextStyle get titleSmall  => TextStyle(color: _c.textPrimary, fontSize: _t.titleSmall.sp(this),  fontWeight: FontWeight.w600, height: _t.lineHeight);
  TextStyle get titleMedium => TextStyle(color: _c.textPrimary, fontSize: _t.titleMedium.sp(this), fontWeight: FontWeight.w600, height: _t.lineHeight);
  TextStyle get titleLarge  => TextStyle(color: _c.textPrimary, fontSize: _t.titleLarge.sp(this),  fontWeight: FontWeight.w700, height: _t.lineHeight);

  // Headlines / Display
  TextStyle get headlineSmall  => TextStyle(color: _c.textPrimary, fontSize: _t.headlineSmall.sp(this),  fontWeight: FontWeight.w600, height: _t.lineHeight);
  TextStyle get headlineMedium => TextStyle(color: _c.textPrimary, fontSize: _t.headlineMedium.sp(this), fontWeight: FontWeight.w700, height: _t.lineHeight);
  TextStyle get headlineLarge  => TextStyle(color: _c.textPrimary, fontSize: _t.headlineLarge.sp(this),  fontWeight: FontWeight.w800, height: _t.lineHeight);

  TextStyle get displaySmall  => TextStyle(color: _c.textPrimary, fontSize: _t.displaySmall.sp(this),  fontWeight: FontWeight.bold, height: _t.lineHeight);
  TextStyle get displayMedium => TextStyle(color: _c.textPrimary, fontSize: _t.displayMedium.sp(this), fontWeight: FontWeight.bold, height: _t.lineHeight);
  TextStyle get displayLarge  => TextStyle(color: _c.textPrimary, fontSize: _t.displayLarge.sp(this),  fontWeight: FontWeight.bold, height: _t.lineHeight);

  // Labels / Buttons
  TextStyle get labelSmall  => TextStyle(color: _c.textSecondary, fontSize: _t.labelSmall.sp(this),  height: _t.lineHeight);
  TextStyle get labelMedium => TextStyle(color: _c.textSecondary, fontSize: _t.labelMedium.sp(this), height: _t.lineHeight);
  TextStyle get labelLarge  => TextStyle(color: _c.textPrimary,   fontSize: _t.labelLarge.sp(this),  height: _t.lineHeight);

  TextStyle get buttonTextStyle => TextStyle(
    color: _c.onPrimary,
    fontSize: _t.buttonText.sp(this),
    fontWeight: FontWeight.w600,
    height: _t.lineHeight,
  );

  // Navigation & Special
  TextStyle get navigationTitleTextStyle => TextStyle(
    color: _c.textPrimary, fontSize: _t.navigationTitle.sp(this),
    fontWeight: FontWeight.w600, height: _t.lineHeight,
  );

  TextStyle get navigationLargeTitleTextStyle => TextStyle(
    color: _c.textPrimary, fontSize: _t.navigationLargeTitle.sp(this),
    fontWeight: FontWeight.bold, height: _t.lineHeight,
  );

  TextStyle get actionTextStyle => TextStyle(
    color: _c.primary, fontSize: _t.actionText.sp(this),
    fontWeight: FontWeight.w600, height: _t.lineHeight,
  );

  TextStyle get pickerTextStyle => TextStyle(
    color: _c.textPrimary, fontSize: _t.pickerText.sp(this),
    height: _t.lineHeight,
  );

  TextStyle get dateTimePickerTextStyle => TextStyle(
    color: _c.textPrimary, fontSize: _t.dateTimePickerText.sp(this),
    height: _t.lineHeight,
  );

  TextStyle get captionTextStyle => TextStyle(
    color: _c.textSecondary, fontSize: _t.caption.sp(this),
    height: _t.lineHeight,
  );
}
*/
