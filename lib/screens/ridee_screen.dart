import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/search_destination.dart';
import '../components/draggable_bottom_sheet.dart';
import '../components/maj/bill_information.dart';
import '../components/custom_map.dart';
import './custom_components.dart';
import '../components/maj/target_information.dart';
import '../components/maj/bill_information.dart';
import '../components/maj/error_information.dart';
import '../components/maj/tertiary_button.dart';

import '../theme.dart';

class RideeScreen extends StatelessWidget {
  final String depart;
  final String destination;

  const RideeScreen({
    Key? key,
    this.depart = "67ha Sud arret 30",
    this.destination = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomMap(),
          ),
          Positioned(
            top: 32 + 16,
            left: 16,
            right: 16,
            child: SearchDestination(),
          ),
          Positioned(
            right: 14,
            bottom: 180,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: customColor.getColor("surfaceContainerLowest"),
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(child: Icon(Icons.my_location, size: 24, color: colorScheme.primary)),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,//0.12,
            minChildSize: 0.05,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                decoration: BoxDecoration(
                  color: customColor.getColor("surfaceContainerLow"),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.26),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 32,
                          height: 4,
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: colorScheme.outline,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                       TargetInformation(),
          SizedBox(height: 8.0),
          BillInformation(),
          ErrorInformation(state: 'config', message: "Veuillez configurer votre wallet",), // Modifier l'état ici
          TertiaryButton(
            label: "Configurer mon wallet",
            icon: Icons.wallet,
            onClick: () {
              print("Bouton cliqué !");
            },
          )

                      // CustomComponents(),
                      // BillInformation(),
                      // Text(
                      //   "Votre position",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontFamily: 'Roboto',
                      //     fontWeight: FontWeight.w600,
                      //     color: colorScheme.onSurface,
                      //   ),
                      // ),
                      // SizedBox(height: 4),
                      // Text(
                      //   depart,
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     fontFamily: 'Roboto',
                      //     fontWeight: FontWeight.w500,
                      //     color: colorScheme.primary,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}