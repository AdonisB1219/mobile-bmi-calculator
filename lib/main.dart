import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFFEDEDED),
        colorScheme: ColorScheme.light().copyWith(
            primary: Color(0XFFEDEDED)),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0XFF666E87)),
          bodyMedium: TextStyle(color: Color(0XFF666E87), fontFamily: 'Nanum Gothic'),
          bodySmall: TextStyle(color: Color(0XFF666E87),
          fontFamily: 'Nanum Gothic'),
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Color(0XFF4D5773),
                fontWeight: FontWeight.w500,
            fontFamily: 'Nanum Gothic',
            fontSize: 20), // Cambia el color del texto a rojo
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            backgroundColor: const Color(0XFF56D0DB),
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0XFFEDEDED), // Cambia el color del botón flotante aquí
        ),
        ),
      );
  }
}


