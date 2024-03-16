import 'package:flutter/material.dart';
import 'package:spend_record/expenses.dart';
  
var KColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181));
var KDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main(){
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: KDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: KDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16
            ),
          ),
        ),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: KColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: KColorScheme.onPrimaryContainer,
              foregroundColor: KColorScheme.primaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: KColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),

            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: KColorScheme.primaryContainer
                )
            ),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: KColorScheme.onSecondaryContainer,
                  fontSize: 20,
                )
            )

        ),
        themeMode: ThemeMode.system,
        home:const Expenses() ,
      ),
  );

 }