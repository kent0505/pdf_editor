import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  fontFamily: AppFonts.w400,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xffE12426),
    selectionColor: Color(0xffE12426),
    selectionHandleColor: Color(0xffE12426),
  ),

  // OVERSCROLL
  colorScheme: const ColorScheme.light(
    surface: Color(0xffF2F2F7), // bg color when push
    secondary: Color(0xff808080), // overscroll
  ),

  // SCAFFOLD
  scaffoldBackgroundColor: const Color(0xffF2F2F7),

  // APPBAR
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffF2F2F7),
    centerTitle: true,
    toolbarHeight: 64, // app bar size
    elevation: 0,
    actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: AppFonts.w400,
    ),
  ),

  // DIALOG
  dialogTheme: const DialogThemeData(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),

  // TEXTFIELD
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    hintStyle: const TextStyle(
      color: Color(0xff707883),
      fontSize: 14,
      fontFamily: AppFonts.w500,
    ),
  ),
);
