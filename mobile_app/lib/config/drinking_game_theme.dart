import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkingGameTheme {
  static Color get primary => Color.fromRGBO(43, 58, 103, 1);

  static Color get secondary => Color.fromRGBO(105, 132, 150, 20);

  static ThemeData light() {
    return ThemeData.light().setStandard().copyWith();
  }

  static ThemeData dark() {
    return ThemeData.dark().setStandard().copyWith(
          listTileTheme: ListTileThemeData(
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          drawerTheme: DrawerThemeData(backgroundColor: primary),
          dividerTheme: DividerThemeData(
            color: secondary,
          ),
          disabledColor: Colors.blueGrey,
          inputDecorationTheme: InputDecorationTheme(
            helperStyle: TextStyle(
              decorationColor: secondary,
              color: secondary,
            ),
            hintStyle: TextStyle(
              color: secondary,
            ),
            focusColor: Colors.white,
            counterStyle: TextStyle(
              color: secondary,
            ),
            iconColor: Colors.white,
            suffixIconColor: Colors.white,
            labelStyle: TextStyle(
                // color: Colors.white,
                ),
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondary,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ))),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: secondary,
            actionTextColor: Colors.white,
          ),
          secondaryHeaderColor: Colors.green,
          backgroundColor: secondary,
          scaffoldBackgroundColor: primary.withOpacity(.5),
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: secondary,
            onPrimary: Colors.white,
            secondary: Colors.amber,
            onSecondary: Colors.white,
            error: Colors.redAccent,
            onError: Colors.white70,
            background: Colors.teal,
            onBackground: Colors.white,
            surface: primary,
            onSurface: Colors.white,
          ),
          chipTheme: ChipThemeData(
              backgroundColor: secondary,
              checkmarkColor: Colors.white,
              deleteIconColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
            ),
            displayLarge: TextStyle(
              color: Colors.white,
            ),
            headlineMedium: TextStyle(
              color: Colors.white,
            ),
            displayMedium: TextStyle(
              color: Colors.white,
            ),
            displaySmall: TextStyle(
              color: Colors.white,
            ),
            titleSmall: TextStyle(
              color: Colors.white,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
            ),
          ),
        );
  }
}

extension _ThemeDataX on ThemeData {
  ThemeData setStandard() {
    return copyWith(
      useMaterial3: true,
      textTheme: GoogleFonts.getTextTheme("Oswald"),
    );
  }
}
