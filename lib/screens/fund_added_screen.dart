import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/logo_button.dart';
import '../components/horizontal_line.dart';
import '../components/transaction_history_item.dart';
import '../components/fund_added_success.dart';

class FundAddedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MaterialTheme.lightScheme().surface,
     
      body: Stack(
        children: [
          FundAddedSuccess(
            amount: "20 000 Ar",
            dateTime: "03/06/2024   13:54:36",
            addedBy: "Lucius Caius",
            phoneNumber: "023456780",
            paymentMethod: "Mvola",
            newBalance: "20 000 Ar",
          )
        ]
      ),
    );
  }
}
