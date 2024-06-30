import 'package:flutter/material.dart';
import 'package:refeicoes/models/settings.dart';
import 'package:refeicoes/screens/meal_detail_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _avalibeMeals = dummyMeals;
  final List<Meal> _favoriteMeal = [];

  void _filterMeal(Settings settings) {
    setState(() {
      this.settings = settings;
      _avalibeMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterVegetarian &&
            !filterVegan &&
            !filterLactose &&
            !filterGluten;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeal.contains(meal)
          ? _favoriteMeal.remove(meal)
          : _favoriteMeal.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeal.contains(meal);
  }

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
        AppRouts.home: (ctx) => TabsScreen(_favoriteMeal),
        AppRouts.categoriesMeal: (ctx) => CategoriesMealsScreen(_avalibeMeals),
        AppRouts.mealDetail: (ctx) =>
            MealDetailScreen(_toggleFavorite, isFavorite),
        AppRouts.settings: (ctx) => SettingScreen(settings, _filterMeal),
      },
    );
  }
}
