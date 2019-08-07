import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();

  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Merriweather',
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        color: const Color(0xFFEEDD99),
      ),
      title: base.title.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 15.0,
        color: const Color(0xFF5E412F),
      ),
      caption: base.caption.copyWith(
        color: const Color(0xFFEEDD99),
      ),
    );
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0,
        color: const Color(0xFF5E412F),
      ),
      title: base.title.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 15.0,
        color: const Color(0xFF5E412F),
      ),
      caption: base.caption.copyWith(
        color: const Color(0xFF78C0A8),
      ),
    );
    /*return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0,
        color: const Color(0xFF807a6b),
      ),
      title: base.title.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 15.0,
        color: const Color(0xFF807A6B),
      ),
      caption: base.caption.copyWith(
        color: const Color(0xFFCCC5AF),
      ),
    );*/
  }

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryColor: const Color(0xFFEEAA88),
    indicatorColor: const Color(0xFFEEDD99),
    scaffoldBackgroundColor: const Color(0xFFEEC290),
    accentColor: const Color(0xE6EEAA88),
    iconTheme: IconThemeData(
      color: const Color(0xFFEEDD99),
      size: 20.0,
    ),
    buttonColor: Colors.white,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryColor: const Color(0xFFF07818),
    indicatorColor: const Color(0xFFFCEBB6),
    scaffoldBackgroundColor: const Color(0xFFFCEBB6),
    accentColor: const Color(0xD9F0A830),
    iconTheme: IconThemeData(
      color: const Color(0xFF78C0A8),
      size: 20.0,
    ),
    buttonColor: Colors.white,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryColor: const Color(0xFFFFF8E1),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    accentColor: const Color(0xFFFFF8E1),
    iconTheme: IconThemeData(
      color: const Color(0xFFCCC5AF),
      size: 20.0,
    ),
    buttonColor: Colors.white,
  );
}
