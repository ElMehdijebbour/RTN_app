import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story/theme/appcolors.dart';


/// this the application global theming configuration
/// TODO : implement the theme
class AppTheme {
  /// themes Section
  static final ThemeData lightTheme = ThemeData(
      pageTransitionsTheme:  const PageTransitionsTheme(builders: {
        TargetPlatform.iOS:  CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      appBarTheme: const AppBarTheme(color: LightThemeColors.primaryColor),
      fontFamily: 'Poppins',
      // Colors:
      primaryColor: LightThemeColors.primaryColor,
      cardColor: LightThemeColors.fillingColor, //Inputs background
      backgroundColor: LightThemeColors.backgroundColor,
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
            primary: LightThemeColors.primaryColor,
            primaryVariant: LightThemeColors.primaryVariant,
            error: LightThemeColors.primaryRedButtonColor,
            secondary: LightThemeColors.secondaryRedButtonColor,
            surface: LightThemeColors.darkButtonColor,
            brightness: Brightness.light),
      ),
      primaryIconTheme: const IconThemeData(color: LightThemeColors.activeIconColor),
      accentIconTheme:const IconThemeData(color: LightThemeColors.passiveIconColor),
      dividerTheme:
      const DividerThemeData(color: LightThemeColors.primaryBorderColor),
      textTheme: const TextTheme(
        caption: TextStyle(color: LightThemeColors.placeHolderColor),
        button: TextStyle(color: LightThemeColors.subHeaderColor),
        overline: TextStyle(color: LightThemeColors.placeHolderColor),
        headline6: TextStyle(color: LightThemeColors.backgroundColor), //Titles
        subtitle1: TextStyle(color: LightThemeColors.subHeaderColor),
        bodyText1: TextStyle(
            color: LightThemeColors.inputColor), // When filling some input
        bodyText2: TextStyle(
            color: LightThemeColors.inputColor, fontSize: 17), // Hints
      ),
      highlightColor: LightThemeColors.primaryColor,
      splashColor: LightThemeColors.primaryColor);

  static final  ThemeData darkTheme = ThemeData(
      pageTransitionsTheme:  const PageTransitionsTheme(builders: {
        TargetPlatform.iOS:  CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      appBarTheme: const AppBarTheme(color: DarkThemeColors.primaryColor),
      fontFamily: 'Poppins',
      // Colors:
      primaryColor: DarkThemeColors.primaryColor,
      cardColor: DarkThemeColors.fillingColor, //Inputs background
      backgroundColor: DarkThemeColors.backgroundColor,
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
            primary: DarkThemeColors.primaryColor,
            primaryVariant: DarkThemeColors.primaryVariant,
            error: DarkThemeColors.primaryRedButtonColor,
            secondary: DarkThemeColors.secondaryRedButtonColor,
            surface: DarkThemeColors.darkButtonColor,
            brightness: Brightness.light),
      ),
      primaryIconTheme: const IconThemeData(color: DarkThemeColors.activeIconColor),
      accentIconTheme: const IconThemeData(color: DarkThemeColors.passiveIconColor),
      dividerTheme: const DividerThemeData(color: DarkThemeColors.primaryBorderColor),
      textTheme:  const TextTheme(
        caption: TextStyle(color: DarkThemeColors.placeHolderColor),
        button: TextStyle(color: DarkThemeColors.subHeaderColor),
        overline: TextStyle(color: DarkThemeColors.placeHolderColor),
        headline6: TextStyle(color: DarkThemeColors.backgroundColor), //Titles
        subtitle1: TextStyle(color: DarkThemeColors.subHeaderColor),
        bodyText1: TextStyle(
            color: DarkThemeColors.inputColor), // When filling some input
        bodyText2: TextStyle(
            color: DarkThemeColors.inputColor, fontSize: 17), // Hints
      ),
      highlightColor: DarkThemeColors.primaryColor,
      splashColor: DarkThemeColors.primaryColor
  );
  static  const SystemUiOverlayStyle sysDarkTheme = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: DarkThemeColors.backgroundColor,
      systemNavigationBarColor: DarkThemeColors.backgroundColor
  );
  static  const SystemUiOverlayStyle sysLightTheme = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: LightThemeColors.backgroundColor,
      systemNavigationBarColor: LightThemeColors.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark
  );

}
