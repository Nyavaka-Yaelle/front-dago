import 'package:flutter/material.dart';
import 'min_tab_item.dart'; // Importez le fichier MinTabItem si nécessaire

class MinTabItems extends StatefulWidget {
  final ValueChanged<int> onTabChanged; // Callback pour informer le parent

  const MinTabItems({Key? key, required this.onTabChanged}) : super(key: key);

  @override
  _MinTabItemsState createState() => _MinTabItemsState();
}

class _MinTabItemsState extends State<MinTabItems> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:MintabItem(
              label: 'En attente',
              isSelected: _selectedIndex == 0, // Si sélectionné ou non
              onTap: () => _onTabSelected(0)
            )
          ),
          Expanded(
            child:MintabItem(
              label: 'En cours',
              isSelected: _selectedIndex == 1, // Si sélectionné ou non
              onTap: () => _onTabSelected(1)
            )
          ),
          Expanded(
            child:MintabItem(
              label: 'Terminé',
              isSelected: _selectedIndex == 2, // Si sélectionné ou non
              onTap: () => _onTabSelected(2)
            )
          ),
        ],
      )
    );
  }
}
