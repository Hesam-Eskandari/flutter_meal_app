import 'package:flutter/material.dart';
import '../../mock_data/categories_mock_data.dart';
import '../widgets/category_item.dart';


class CategoriesPage extends StatelessWidget {
  static const routeName = '/';

  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
        ),
        children: dummyCategories.map((catData) =>
            Container(
                margin: const EdgeInsets.all(5),
                child: CategoryItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                )
            )
        ).toList(),
      )
    );
  }
}
