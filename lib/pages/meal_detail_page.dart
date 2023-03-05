import 'package:flutter/material.dart';
import '../mock_data/meals_mock_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailPage({Key? key}) : super(key: key);

  Widget _buildSectionTile(BuildContext context, text) {
    return Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(text, style: Theme.of(context).textTheme.bodySmall,),
        ));
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      width: 300,
      child: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: child
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = (ModalRoute.of(context)?.settings.arguments as Map)['id'];
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title),),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
              height: 260,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
            child: Text('Ingredients', style: Theme.of(context).textTheme.bodyMedium,),
          ),
          _buildContainer(
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final String ingredient =  selectedMeal.ingredients[index];
                  return _buildSectionTile(ctx, ingredient);
                },
                itemCount: selectedMeal.ingredients.length),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
            child: Text('Steps', style: Theme.of(context).textTheme.bodyMedium,),
          ),
          _buildContainer(
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final String step =  selectedMeal.steps[index];
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(step, style: Theme.of(context).textTheme.bodySmall,),
                    ),
                    const Divider(),
                  ],);
                  // _buildSectionTile(ctx, step);
                },
                itemCount: selectedMeal.steps.length),
          ),
        ],),
      )
    );
  }
}
