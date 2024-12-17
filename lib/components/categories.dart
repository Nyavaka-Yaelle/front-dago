import 'package:flutter/material.dart';
import 'package:project1/components/custom_item.dart';
import './custom_icon_button.dart';
import '../theme.dart'; // Importez le fichier TabItem si nécessaire

class Categories extends StatefulWidget {
  final bool titled;
const Categories({
    Key? key,
    this.titled = true, // Défaut à `true` si non spécifié
  }) : super(key: key);
  
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
      width: MediaQuery.of(context).size.width,
      padding: widget.titled? EdgeInsets.all(12): EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(children: [
        if(widget.titled) Row(
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
        Container(
            width: MediaQuery.of(context).size.width,
            padding: widget.titled? EdgeInsets.fromLTRB(0, 4, 0, 4): EdgeInsets.all(0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                ))),

        //   Container(
        //     padding: EdgeInsets.symmetric(vertical:12),
        //     width: MediaQuery.of(context).size.width,
        //    child: SingleChildScrollView(
        //       scrollDirection: Axis.vertical,
        //       child: Wrap(
        //         spacing: 6.0, // Espace horizontal entre les éléments
        //         runSpacing: 16.0, // Espace vertical entre les lignes d'éléments
        //         children: [
        //           if(_selectedIndex==0)
        //           // Column(
        //           //   children: [
        //               FoodCard(nomPlat: "Atin'ny coucou", nomResto: "Pakopako", prix: 15000.0, star: 4.6),
        //               FoodCard(nomPlat: "Poulet Roti", nomResto: "Chez Mama", prix: 20000.0, star: 4.8),
        //               FoodCard(nomPlat: "Burger Deluxe", nomResto: "FastFood Pro", prix: 12000.0, star: 4.2),
        //               FoodCard(nomPlat: "Pizza Royale", nomResto: "Pizzaland", prix: 18000.0, star: 4.7),
        //             // ],
        //           // ),
        //           if (_selectedIndex==1) Column(
        //             children: [
        //               RestoCard(nomResto: "Extra Pizza", ouvert: true, description: "Créateur de la pizza feuilletée et Leader du French tacos à Madagascar",star: 4.6)
        //             ],
        //           )
        //         ],
        //       ),
        //     )

        //   )
      ]),
    );
  }
}
