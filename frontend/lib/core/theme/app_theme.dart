import 'package:flutter/material.dart';
import 'app_colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.secondary,
        selectionColor: AppColors.secondary.withOpacity(0.1),
        selectionHandleColor: AppColors.secondary,
      ),
      cardColor: AppColors.cardBackground,
      cardTheme: const CardTheme(
        color: AppColors.cardBackground,
      ),
      textTheme: TextTheme(
        // Titles
        displayLarge: GoogleFonts.montserrat(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
        titleLarge: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),

        // Body text
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleTextStyle: GoogleFonts.montserrat(
          color: AppColors.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.tabActive,
        unselectedItemColor: AppColors.tabInactive,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.secondary,
        ),
        unselectedLabelStyle: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.tabInactive,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary, // Loading indicator color
      ),
    );
  }
}