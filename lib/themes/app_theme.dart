import 'package:flutter/material.dart';

class AppTheme {
  
  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.red,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.redAccent
    )
  );

}