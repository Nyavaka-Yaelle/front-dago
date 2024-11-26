import 'package:flutter/material.dart';
import 'package:project1/components/custom_item.dart';
import './custom_icon_button.dart';
import './food_card.dart';
import '../theme.dart'; // Importez le fichier TabItem si nécessaire

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onPressed() {
    print("button pressed");
  }


  bool isActive(id) {
    return id == _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Catégories',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.33,
                decoration: TextDecoration.none,
                color: MaterialTheme.lightScheme().primary,
              ),
            ),
            Spacer(),
            CustomIconButton(
                label: "Voir tout",
                onPressed: onPressed,
                icon: Icons.arrow_right_alt_rounded,
                color: MaterialTheme.lightScheme().primaryContainer)
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Permet le défilement horizontal
            child: Row(
              children: [
                CustomItem(
                  label: "Tout",
                  onPressed: () => {_onTabSelected(0)},
                  active: isActive(0),
                  icon: Icons.all_inclusive_outlined,
                  activeIcon: Icons.all_inclusive_rounded,
                ),
                CustomItem(
                  label: "Pizza",
                  onPressed: () => {_onTabSelected(1)},
                  active: isActive(1),
                  icon: Icons.local_pizza_outlined,
                  activeIcon: Icons.local_pizza_rounded,
                ),
                CustomItem(
                  label: "Burger",
                  onPressed: () => {_onTabSelected(2)},
                  active: isActive(2),
                  icon: Icons.lunch_dining_outlined,
                  activeIcon: Icons.lunch_dining_rounded,
                ),
                CustomItem(
                  label: "Glaces",
                  onPressed: () => {_onTabSelected(3)},
                  active: isActive(3),
                  icon: Icons.icecream_outlined,
                  activeIcon: Icons.icecream_rounded,
                )
              ],
            )
          )
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              FoodCard(nomPlat: "Atin'ny coucou", nomResto: "Pakopako", prix: 15000.0, star: 4.6,)
            ]), // Permet le défilement horizontal
          )
        )
      ]),
    );
  }
}
