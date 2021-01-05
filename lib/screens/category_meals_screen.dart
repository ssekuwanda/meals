import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final catergoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: catergoryMeals[index].title,
            imageUrl: catergoryMeals[index].imageUrl,
            complexity: catergoryMeals[index].complexity,
            duration: catergoryMeals[index].duration,
            affordability: catergoryMeals[index].affordability,
          );
        },
        itemCount: catergoryMeals.length,
      ),
    );
  }
}
