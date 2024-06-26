import 'package:flutter/material.dart';
import 'package:refeicoes/screens/meal_detail_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';

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
              )),
      routes: {
        AppRouts.home: (ctx) => const TabsScreen(),
        AppRouts.categoriesMeal: (ctx) => const CategoriesMealsScreen(),
        AppRouts.mealDetail: (ctx) => const MealDetailScreen(),
        AppRouts.settings: (ctx) => const SettingScreen(),
      },
    );
  }
}
