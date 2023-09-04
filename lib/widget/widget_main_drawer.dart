import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: Colors.black,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
