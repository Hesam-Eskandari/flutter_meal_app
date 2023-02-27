import 'package:flutter/material.dart';

import '../pages/category_item_page.dart';

class CategoryItem extends StatelessWidget {
  final String _id;
  final String title;
  final Color color;

  CategoryItem({required id, required this.title, this.color=Colors.orange}) : _id = id, super(key: ValueKey(id));

  String get id => _id;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
        CategoryItemPage.routName,
        arguments: {'categoryId': _id,  'categoryTitle': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      ),
    );
  }
}
