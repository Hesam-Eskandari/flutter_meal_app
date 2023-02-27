
enum Complexity {
  simple,
  challenging,
  hard
}

extension DescribeComplexity on Complexity {
  String toText() {
    String value = '';
    switch (this) {
      case Complexity.simple:
        value = 'Simple';
        break;
      case Complexity.challenging:
        value = 'Challenging';
        break;
      case Complexity.hard:
        value = 'Hard';
        break;
    }
    return value;
  }
}


enum Affordability {
  affordable,
  pricey,
  luxurious
}

extension DescribeAffordability on Affordability {
  String toText() {
    String value = '';
    switch (this) {

      case Affordability.affordable:
        value = 'Affordable';
        break;
      case Affordability.pricey:
        value = 'Expensive';
        break;
      case Affordability.luxurious:
        value = 'Luxury';
        break;
    }
    return value;
  }
}

class Meal {
  final String id;
  final List<String> categoryIds;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categoryIds,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian});
}
