import "package:flutter/material.dart";
import 'package:flutter_meals_app/pages/favorites_page.dart';
import 'package:flutter_meals_app/pages/meal_detail_page.dart';
import 'package:flutter_meals_app/pages/tabs_page.dart';
import 'pages/categories_page.dart';
import 'pages/category_item_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontSize: 20),
          bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontSize: 16),
          bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontSize: 12),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      // home: const CategoriesPage(),
      initialRoute: '/',
      routes: {
        TabsPage.routeName : (ctx) => const TabsPage(),
        FavoritesPage.routeName : (ctx) => const FavoritesPage(),
        CategoriesPage.routeName : (ctx) => const CategoriesPage(),
        CategoryItemPage.routeName: (ctx) => const CategoryItemPage(),
        MealDetailPage.routeName: (ctx) => const MealDetailPage(),
      },
      // onGenerateRoute: ,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesPage());
      },
    );
  }
}
