import 'package:adaptive_theme_extension/theme/text_roles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'typography_tokens.dart';
import 'font_scaling.dart';

/// Builds a comprehensive ThemeData by applying sub-themes for Material components.
/// This function does not read Theme.of(context) — it uses only passed tokens and colors.
ThemeData applyComponentThemes(
    ThemeData baseTheme,
    AppColors appColors,
    AppTypographyTokens typographyTokens,
    BuildContext context,
    ) {
  final r = ComponentRoleStyles(
    colors: appColors,
    tokens: typographyTokens,
    buildContext: context,
  );

  return baseTheme.copyWith(
    // ========== App Bar ==========
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.surface,
      foregroundColor: appColors.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: r.navigationTitleTextStyle,
      toolbarTextStyle: r.bodyMediumTextStyle,
      iconTheme: IconThemeData(color: appColors.onSurface),
      actionsIconTheme: IconThemeData(color: appColors.onSurface),
    ),

    // ========== Cards ==========
    cardTheme: CardThemeData(
      color: appColors.surface,
      elevation: 0,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.transparent,
    ),

    // ========== Buttons ==========
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: appColors.onPrimary,
        backgroundColor: appColors.primary,
        textStyle: r.buttonTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: appColors.onPrimary,
        backgroundColor: appColors.primary,
        textStyle: r.buttonTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: appColors.primary,
        side: BorderSide(color: appColors.primary),
        textStyle: r.actionTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appColors.primary,
        textStyle: r.actionTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(appColors.onSurface),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.primary,
      foregroundColor: appColors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // ========== Inputs ==========
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: appColors.surface,
      hintStyle: r.labelMediumTextStyle,
      labelStyle: r.labelLargeTextStyle,
      helperStyle: r.captionTextStyle,
      errorStyle: r.captionTextStyle.copyWith(color: appColors.error),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.divider),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.error, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.error, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIconColor: appColors.textSecondary,
      suffixIconColor: appColors.textSecondary,
    ),

    // ========== Selection Controls ==========
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
            ? appColors.primary
            : appColors.divider,
      ),
      checkColor: MaterialStatePropertyAll(appColors.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
            ? appColors.primary
            : appColors.divider,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
            ? appColors.onPrimary
            : appColors.divider,
      ),
      trackColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
            ? appColors.primary
            : appColors.divider,
      ),
    ),

    // ========== Lists ==========
    listTileTheme: ListTileThemeData(
      iconColor: appColors.textSecondary,
      textColor: appColors.textPrimary,
      titleTextStyle: r.titleMediumTextStyle,
      subtitleTextStyle: r.bodySmallTextStyle,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // ========== Chips ==========
    chipTheme: baseTheme.chipTheme.copyWith(
      backgroundColor: appColors.surface,
      selectedColor: appColors.primary.withOpacity(0.12),
      labelStyle: r.labelLargeTextStyle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: BorderSide(color: appColors.divider),
    ),

    // ========== Navigation ==========
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: appColors.surface,
      indicatorColor: appColors.primary.withOpacity(0.12),
      labelTextStyle: MaterialStatePropertyAll(r.labelMediumTextStyle),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColors.surface,
      selectedItemColor: appColors.primary,
      unselectedItemColor: appColors.textSecondary,
      selectedLabelStyle: r.labelMediumTextStyle,
      unselectedLabelStyle: r.labelSmallTextStyle,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: appColors.surface,
      selectedIconTheme: IconThemeData(color: appColors.primary),
      unselectedIconTheme: IconThemeData(color: appColors.textSecondary),
      selectedLabelTextStyle: r.labelMediumTextStyle.copyWith(color: appColors.primary),
      unselectedLabelTextStyle: r.labelMediumTextStyle.copyWith(color: appColors.textSecondary),
      indicatorColor: appColors.primary.withOpacity(0.12),
    ),
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: appColors.surface,
      surfaceTintColor: Colors.transparent,
      indicatorColor: appColors.primary.withOpacity(0.12),
      elevation: 0,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: appColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // ========== Tabs ==========
    tabBarTheme: TabBarThemeData(
      labelStyle: r.titleMediumTextStyle,
      unselectedLabelStyle:
      r.titleMediumTextStyle.copyWith(color: appColors.textSecondary),
      labelColor: appColors.primary,
      unselectedLabelColor: appColors.textSecondary,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: appColors.divider,
    ),

    // ========== Overlays ==========
    dialogTheme: DialogThemeData(
      backgroundColor: appColors.surface,
      titleTextStyle: r.titleLargeTextStyle,
      contentTextStyle: r.bodyMediumTextStyle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: appColors.surface,
      modalBackgroundColor: appColors.surface,
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: appColors.onSurface,
      contentTextStyle: r.bodyMediumTextStyle.copyWith(color: appColors.surface),
      actionTextColor: appColors.primary,
      behavior: SnackBarBehavior.floating,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: appColors.onSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: r.labelMediumTextStyle.copyWith(color: appColors.surface),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: appColors.surface,
      textStyle: r.bodyMediumTextStyle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
    ),

    // ========== Pickers ==========
    datePickerTheme: DatePickerThemeData(
      backgroundColor: appColors.surface,
      headerForegroundColor: appColors.textPrimary,
      headerBackgroundColor: appColors.surface,
      dayForegroundColor: MaterialStatePropertyAll(appColors.textPrimary),
      todayForegroundColor: MaterialStatePropertyAll(appColors.primary),
      rangePickerHeaderForegroundColor: appColors.textPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      yearForegroundColor: MaterialStatePropertyAll(appColors.textPrimary),
      weekdayStyle: r.labelMediumTextStyle,
      dayStyle: r.bodyMediumTextStyle,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: appColors.surface,
      hourMinuteTextColor: appColors.textPrimary,
      dialHandColor: appColors.primary,
      dialBackgroundColor: appColors.primary.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      helpTextStyle: r.labelMediumTextStyle,
      hourMinuteTextStyle: r.titleLargeTextStyle,
    ),

    // ========== Text Selection / Cursor ==========
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: appColors.primary,
      selectionColor: appColors.primary.withOpacity(0.25),
      selectionHandleColor: appColors.primary,
    ),

    // ========== Scrolling / Feedback ==========
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStatePropertyAll(appColors.primary.withOpacity(0.5)),
      trackColor: MaterialStatePropertyAll(appColors.divider),
      radius: const Radius.circular(12),
      thickness: MaterialStatePropertyAll(6),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: appColors.primary,
      linearTrackColor: appColors.divider,
      circularTrackColor: appColors.divider,
    ),

    // ========== Sliders ==========
    sliderTheme: SliderThemeData(
      activeTrackColor: appColors.primary,
      inactiveTrackColor: appColors.divider,
      thumbColor: appColors.primary,
      overlayColor: appColors.primary.withOpacity(0.12),
      valueIndicatorTextStyle: r.labelSmallTextStyle.copyWith(color: appColors.onPrimary),
    ),

    // ========== Dividers / Icons ==========
    dividerTheme: DividerThemeData(
      color: appColors.divider,
      thickness: 1,
      space: 1,
    ),
    iconTheme: IconThemeData(color: appColors.onSurface),

    // ========== Data / Lists ==========
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: appColors.surface,
      collapsedBackgroundColor: appColors.surface,
      textColor: appColors.textPrimary,
      collapsedTextColor: appColors.textPrimary,
      iconColor: appColors.primary,
      collapsedIconColor: appColors.textSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dataTableTheme: DataTableThemeData(
      headingTextStyle: r.titleSmallTextStyle,
      dataTextStyle: r.bodyMediumTextStyle,
      headingRowColor: MaterialStatePropertyAll(appColors.surface),
      dividerThickness: 1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    ),

    // ========== Badges (Material 3) ==========
    badgeTheme: const BadgeThemeData(), // You can style with colors.primary if you use badges.
  );
}



/*
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'text_roles.dart';

ThemeData applyComponentThemes(ThemeData base, AppColors c, BuildContext context) {
  // Text styles (built from tokens + colors)
  final t = Theme.of(context).textTheme;

  return base.copyWith(
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: c.surface,
      foregroundColor: c.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: context.navigationTitleTextStyle,
      toolbarTextStyle: context.bodyMedium,
      iconTheme: IconThemeData(color: c.onSurface),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: c.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(8),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: c.onPrimary,
        backgroundColor: c.primary,
        textStyle: context.buttonTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: c.onPrimary,
        backgroundColor: c.primary,
        textStyle: context.buttonTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: c.primary,
        side: BorderSide(color: c.primary),
        textStyle: context.actionTextStyle,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: c.primary,
        textStyle: context.actionTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(c.onSurface),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: c.primary,
      foregroundColor: c.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: c.surface,
      hintStyle: context.labelMedium,
      labelStyle: context.labelLarge,
      helperStyle: context.captionTextStyle,
      errorStyle: context.captionTextStyle.copyWith(color: c.error),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.divider),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.primary, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.error, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.error, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Selection controls
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.primary : c.divider),
      checkColor: WidgetStatePropertyAll(c.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.primary : c.divider),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.onPrimary : c.divider),
      trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.primary : c.divider),
    ),

    // Lists
    listTileTheme: ListTileThemeData(
      iconColor: c.textSecondary,
      textColor: c.textPrimary,
      titleTextStyle: t.titleMedium,
      subtitleTextStyle: t.bodySmall,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Chips
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: c.surface,
      selectedColor: c.primary.withOpacity(.12),
      labelStyle: t.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: BorderSide(color: c.divider),
    ),

    // Navigation
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: c.surface,
      indicatorColor: c.primary.withOpacity(.12),
      labelTextStyle: WidgetStatePropertyAll(t.labelMedium),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: c.surface,
      selectedItemColor: c.primary,
      unselectedItemColor: c.textSecondary,
      selectedLabelStyle: t.labelMedium,
      unselectedLabelStyle: t.labelSmall,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: t.titleMedium,
      unselectedLabelStyle: t.titleMedium?.copyWith(color: c.textSecondary),
      labelColor: c.primary,
      unselectedLabelColor: c.textSecondary,
      indicatorSize: TabBarIndicatorSize.label,
    ),

    // Overlays
    dialogTheme: DialogThemeData(
      backgroundColor: c.surface,
      titleTextStyle: t.titleLarge,
      contentTextStyle: t.bodyMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: c.surface,
      modalBackgroundColor: c.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: c.onSurface,
      contentTextStyle: t.bodyMedium?.copyWith(color: c.surface),
      actionTextColor: c.primary,
      behavior: SnackBarBehavior.floating,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: c.onSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: t.labelMedium?.copyWith(color: c.surface),
    ),

    // Misc
    dividerTheme: DividerThemeData(color: c.divider, thickness: 1),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: c.primary),
  );
}
*/
