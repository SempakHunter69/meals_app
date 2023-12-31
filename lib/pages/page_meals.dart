import 'package:flutter/material.dart';
import 'package:meals_app/model/model_meal.dart';
import 'package:meals_app/pages/page_meal_details.dart';
import 'package:meals_app/widget/widget_meal_item.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsPage(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... nothing here !',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: selectMeal,
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      ),
    );
  }
}
