import 'package:flutter/material.dart';

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
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ThemeInfo.elevatedButtonTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeInfo.backgroundColor,
        elevation: 0,
      ),
      fontFamily: 'OpenSans',
    );
  }
}
