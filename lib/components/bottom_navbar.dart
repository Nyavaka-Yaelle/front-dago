import 'package:flutter/material.dart';
import '../theme.dart';
import './bottom_navbar_item.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // État pour chaque élément de la barre de navigation
  bool isHomeActive = false;
  bool isNotifActive = false;
  bool isDeliveryActive = false;
  bool isProfileActive = false;

  // Fonction pour gérer l'activation/désactivation d'un élément
  void toggleActive(String item) {
    setState(() {
      // Désactiver tous les autres éléments
      isHomeActive = item == 'home' ? !isHomeActive : false;
      isNotifActive = item == 'notif' ? !isNotifActive : false;
      isDeliveryActive = item == 'delivery' ? !isDeliveryActive : false;
      isProfileActive = item == 'profile' ? !isProfileActive : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: MaterialTheme.lightScheme().surfaceContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavbarItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: "Home",
            isActive: isHomeActive,
            onTap: () => toggleActive('home'),  // Appel de la fonction pour activer/désactiver
          ),
          BottomNavbarItem(
            icon: Icons.notifications_outlined,
            activeIcon: Icons.notifications_rounded,
            label: "Notification",
            badgeCount: 3,
            showBadge: true,
            isActive: isNotifActive,
            onTap: () => toggleActive('notif'),
          ),
          BottomNavbarItem(
            icon: Icons.delivery_dining_outlined,
            activeIcon: Icons.delivery_dining_rounded,
            label: "Livraison",
            isActive: isDeliveryActive,
            onTap: () => toggleActive('delivery'),
          ),
          BottomNavbarItem(
            icon: Icons.account_circle_outlined,
            activeIcon: Icons.account_circle_rounded,
            label: "Profil",
            isActive: isProfileActive,
            onTap: () => toggleActive('profile'),
          ),
        ],
      ),
    );
  }
}
