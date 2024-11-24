import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ThemeUtils {
  static const defaultElevation = 2.5;
  static const primaryBlue = Color(0xff273068);
  static const secondaryGreenBlue = Color(0xff52B69A);
  static const yellowgood = Color(0xffeaf4f4);
  static const subtitleGrey = Color(0xff979797);
  static const inputFill = Color(0xffF5F5F5);
  static const hintColor = Color(0xFF555555);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const darkMode = Color(0xff1F222A);
  static const darkMode2 = Color(0xff2C2C2C);
  static const mov = Color(0xffa8dadc) ;
  static const splashColorPurple = Color(0xffAC8A84);
  static const fillColorLight = Color(0xffF3F3F3);
  static const fillColorDark = Color(0xff1F222A);

  //LightMode
  static ThemeData light = ThemeData(
    textTheme: TextTheme(
        headlineSmall: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 24.sp),
        bodySmall: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 12.sp),
        bodyMedium: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 14.sp),
        bodyLarge: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 16.sp),
        labelSmall: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 11.sp),
        labelMedium: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 12.sp),
        labelLarge: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 14.sp),
        titleSmall: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 14.sp),
        titleMedium: TextStyle(
            color: subtitleGrey,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
        titleLarge: TextStyle(
            color: Colors.black, fontFamily: 'Jost', fontSize: 22.sp)),
    fontFamily: 'Jost',
    //brightness
    //brightness: Brightness.light,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primaryBlue,
      selectedIconTheme: IconThemeData(color: white),
      unselectedItemColor: subtitleGrey,
    ),

    //Splash Color for press
    splashColor: primaryBlue,

    //floating Action Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryGreenBlue,
    ),

    //AppBarTheme
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: white,
        ),
        titleTextStyle: TextStyle(
            color: black, fontSize: 22.sp, fontWeight: FontWeight.bold)),

    //scaffoldBackgroundColor
    scaffoldBackgroundColor: white,

    //iconTheme
    iconTheme: const IconThemeData(color: black),

    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(327.w, 54.h),
          backgroundColor: secondaryGreenBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: TextStyle(
              color: black,
              fontFamily: 'Berlin',
              fontWeight: FontWeight.normal)),
    ),

    //dialogTheme
    dialogTheme: DialogTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: white),

    //cardTheme
    cardTheme: CardTheme(
      color: white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),

    //textButtonTheme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        fixedSize: Size(327.w, 54.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(
            fontFamily: 'Mulish', fontSize: 16.sp, fontWeight: FontWeight.w500),
        foregroundColor: white,
        backgroundColor: secondaryGreenBlue,
        elevation: 4.0,
        shadowColor: black,
      ),
    ),

    //bottmSheetTheme
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white),

    //snackBarTheme
    snackBarTheme: const SnackBarThemeData(
      elevation: defaultElevation,
      backgroundColor: primaryBlue,
      contentTextStyle: TextStyle(
        fontSize: 16,
        color: white,
      ),
      behavior: SnackBarBehavior.floating,
    ),

    //border ,cursor theme
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryBlue),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBlue, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      fillColor: inputFill,
    ),
  );


}
