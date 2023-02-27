import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String _title;
  final String _imageUrl;
  final int _duration;
  final Complexity _complexity;
  final Affordability _affordability;

  const MealItem(
      {
        Key? key, required title, required imageUrl,
        required duration, required complexity,
        required affordability}) :
        _title = title, _imageUrl = imageUrl, _duration = duration,
        _complexity = complexity, _affordability = affordability,
        super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft:  Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(
                    _imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover
                  )
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black38,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      _title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('$_duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(_complexity.toText())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(_affordability.toText())
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
