import 'package:flutter/material.dart';
import '../theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int badgeCount;
  final bool showBadge;
  final bool isActive;
  final Function() onTap;  // Callback pour gérer l'activation

  BottomNavbarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.badgeCount = 0,
    this.showBadge = false,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return GestureDetector(  
      onTap: onTap,  // Appel du callback sur le tap
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Rectangle arrondi derrière l'icône
              Container(
                width: 50,
                height: 32,
                decoration: BoxDecoration(
                  color: isActive? colorScheme.secondaryContainer: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  isActive? activeIcon: icon, 
                  size: 24, 
                  color: isActive? colorScheme.onSurface: colorScheme.onSurfaceVariant.withOpacity(1),
                ),
              ),
              // Badge rouge
              if (showBadge && badgeCount == 1)
              Positioned(
                  top: 4,
                  left: 12+18,
                  child: 
                  Badge(smallSize: 6),
              ),
              if (showBadge && badgeCount >1)
                Positioned(
                  top: 2,
                  left: 26,
                  child: 
                  Badge.count(largeSize: 16, count: badgeCount>999? 999: badgeCount, textColor: colorScheme.onError),
                  // Container(
                  //   height: 16,
                  //   width: 16,
                  //   // padding: EdgeInsets.all(6),
                  //   decoration: BoxDecoration(
                  //     color: colorScheme.error,
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: Center(child:Text(
                  //     badgeCount>1 ? badgeCount>99? "99+" : badgeCount.toString() : "",
                  //     style: TextStyle(
                  //       color:  colorScheme.onError,
                  //       fontSize: 11,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   )),
                  // ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            height: 18,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: isActive? FontWeight.w600: FontWeight.w400,
                  color: isActive? colorScheme.onSurface: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
   
          // Text(
          //   label,
          //   style: TextStyle(
          //     fontFamily: 'Roboto',
          //     fontSize: 14,
          //     fontWeight: isActive? FontWeight.w600: FontWeight.w400,
          //     color: isActive? colorScheme.onSurface: colorScheme.onSurfaceVariant,
          //   ),
          // ),
        ],
      )
    );
  }
}
