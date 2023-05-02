import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ThemeInfo {
  // Colores de barra superior e inferior Android
  static const statusBarColor = Color(0xffe12022);
  static const systemNavigationBarColor = Colors.black;

  //Fondo
  // static const backgroundColor = Color.fromARGB(255, 239, 236, 236);
  static const backgroundColor = Color(0xffF4EFF3);

  //Colores para usar
  // static const Color rojo = Color(0xffe12022);
  static const colorText01 = Color(0xff383348);
  static const colorText02 = Color(0xff595467);
  static const colorText03 = Color(0xff8B8B99);
  static const colorTextInputs01 = Color(0xffB8B6C0);

  //Colores buttons
  static const backgroundColorButton01 = Color(0xfff86a68);

  //Estilos de texto
  // static const estiloTextoCabecera = TextStyle(color: Colors.white, fontSize: 29, fontWeight: FontWeight.bold);
  static const styleInputsText = TextStyle(
    color: Colors.black87,
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
  );
  static const styleText = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    // fontWeight: FontWeight.w500,
  );
  static const styleInputsHintText = TextStyle(
    color: colorTextInputs01,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const styleTitleApp = TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: colorText01);
  static const styleSubTitleApp1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: ThemeInfo.colorText02,
  );
  // static BoxDecoration getFichaDecotarion() {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(20),
  //     color: Colors.white,
  //     boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.grey.withOpacity(.2), blurRadius: 2, spreadRadius: 1)],
  //   );
  // }

  //Buttons
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColorButton01,
      elevation: 5,
      shadowColor: Colors.black38,
      minimumSize: const Size(352, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData getTheme() {
    return ThemeData(
      // brightness: BrightnessColor(0xFFC5C5C5), 197, 1)imarySwatch: generateMaterialColor(Palette.primary),
      // primaryColor: Colors.orange[400],
      // accentColor: Colors.blue,
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ThemeInfo.elevatedButtonTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeInfo.backgroundColor,
        elevation: 0,
      ),
      //backgroundColor: backgroundColor,
      // scaffoldBackgroundColor: const Color(0xff110e15),
      fontFamily: 'OpenSans',
      //Color para circularProgressIndicator
      // colorScheme: ColorScheme.fromSeed(
      // seedColor: grisClaro,
      // primary: rojo,
      // ),
    );
  }

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) =>
      Color.fromRGBO(tintValue(color.red, factor), tintValue(color.green, factor), tintValue(color.blue, factor), 1);

  static int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) =>
      Color.fromRGBO(shadeValue(color.red, factor), shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
}

class Palette {
  static const Color primary = Color(0xFFb97625);
}
