import 'package:flutter/cupertino.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites';

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('The Favorites!'),);
  }
}
