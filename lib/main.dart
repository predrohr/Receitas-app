import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.pink,
        secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 225, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ), 
        )
      ),
      home: const CategoryScreen(),
    );
  }
}
 