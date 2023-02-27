import 'package:flutter/material.dart';
import '../mock_data/meals_mock_data.dart';
import '../widgets/meal_item.dart';

class CategoryItemPage extends StatelessWidget {
  static const routName = '/category-item-page';

  const CategoryItemPage({super.key});

  // final String _categoryId;
  // final String _categoryTitle;
  //
  // CategoryItemPage({required String categoryId, required String categoryTitle}) :
  //       _categoryId = categoryId, _categoryTitle = categoryTitle, super(key: ValueKey(categoryId));

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeArgs['categoryId'];
    final String? categoryTitle = routeArgs['categoryTitle'];
    final selectedMeals = dummyMeals.where((meal) => meal.categoryIds.contains(categoryId!)).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!),),
      body: ListView.builder(itemBuilder: (ctx, index) {
        final meal = selectedMeals[index];
        return MealItem(
          imageUrl: meal.imageUrl,
          title: meal.title,
          affordability: meal.affordability,
          complexity: meal.complexity,
          duration: meal.duration,
        );
      }, itemCount: selectedMeals.length,),
    );
  }
}
