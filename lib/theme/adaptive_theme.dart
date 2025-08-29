// lib/theme/adaptive_theme.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'color_palettes.dart';
import 'typography_tokens.dart';
import 'screen_size.dart';
import 'component_themes.dart';

class AdaptiveTheme extends StatelessWidget {
  final ThemeMode themeMode;
  final Widget child;
  const AdaptiveTheme({super.key, required this.themeMode, required this.child});

  @override
  Widget build(BuildContext context) {
    // 1) Choose color palette (light/dark/system)
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final isDark = switch (themeMode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => platformBrightness == Brightness.dark,
    };
    final AppColors colors = isDark ? DarkAppColors : LightAppColors;

    // 2) Choose typography tokens by screen size
    final size = getScreenSize(context);
    final AppTypographyTokens tokens = switch (size) {
      ScreenSize.small => smallPhonesTypography,
      ScreenSize.normal => normalPhonesTypography,
      ScreenSize.large => tabletsTypography,
      ScreenSize.extraLarge => desktopTypography,
    };

    // 3) Build base Material ThemeData (Material 3)
    final base = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      // Register our custom extensions
      extensions: <ThemeExtension<dynamic>>[
        colors,
        tokens,
      ],
      // Optional: seed the text theme; final styles come from extensions in components
      textTheme: Typography.material2021(platform: defaultTargetPlatform)
          .black
          .apply(displayColor: colors.textPrimary, bodyColor: colors.textPrimary),
      scaffoldBackgroundColor: colors.background,
    );

    // 4) Apply comprehensive component themes
    final themed = applyComponentThemes(base, colors,tokens, context);

    // 5) Make Cupertino widgets automatically follow Material
    final cupertino = MaterialBasedCupertinoThemeData(materialTheme: themed);

    return Theme(
      data: themed,
      child: CupertinoTheme(
        data: cupertino,
        child: child,
      ),
    );
  }
}
