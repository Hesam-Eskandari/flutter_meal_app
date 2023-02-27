import "package:flutter/material.dart";
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
          bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
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
        CategoriesPage.routeName : (ctx) => const CategoriesPage(),
        CategoryItemPage.routName: (ctx) => const CategoryItemPage(),
      },
    );
  }
}
