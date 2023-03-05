import 'package:flutter/material.dart';
import 'package:flutter_meals_app/pages/categories_page.dart';

import './favorites_page.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/';

  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  static const Widget title = Text('Meals');

  static const List<Widget> _pages = [
    CategoriesPage(),
    FavoritesPage(),
  ];

  static const _pageTitles = [
    'Categories', 'Favorites'
  ];

  static const _categoriesIcon = Icon(Icons.category);
  static const _categoriesText = 'Categories';
  static const _favoritesIcon = Icon(Icons.star);
  static const _favoritesText = 'Favorites';

  int _selectedPageIndex = 0;

  // default can work in stateless mode as well
  Widget _getDefaultTabNavigation(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: title,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: _categoriesIcon,
              text: _categoriesText,
            ),
            Tab(
                icon: _favoritesIcon,
                text: _favoritesText
            ),
          ],),
        ),
        body: const TabBarView(
          children: _pages,
        ),
      ),
    );
  }

  Widget _getBottomTabNavigation(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_selectedPageIndex]),
      ),
      drawer: Drawer(child: Text('The Drawer!')),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => _selectPage(index),
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColorDark,
            icon: _categoriesIcon,
            label: _categoriesText,
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColorDark,
            icon: _favoritesIcon,
            label: _favoritesText,
          ),
        ],
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return _getBottomTabNavigation(context);
  }
}
