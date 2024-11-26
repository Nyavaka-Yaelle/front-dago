import 'package:flutter/material.dart';
import '../components/connexion_button.dart';
import '../components/ridee_info.dart';
import '../components/foodee_info.dart';
import '../theme.dart';

class PageInfo extends StatefulWidget {
  final int idService;

  const PageInfo({
    Key? key,
    this.idService = 1, 
    // Valeur par défaut
  }) : super(key: key);

  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLowest;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 50
          ? MaterialTheme.lightScheme().surfaceContainerLowest
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: MaterialTheme.lightScheme().onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical:0,horizontal:16),
                child: Column(
                  children: [
                    if(widget.idService==0) RideeInfo(),
                    if(widget.idService==1) FoodeeInfo(),
                ])
              ),
              //  Expanded(
              //   child: Container(), // Cet Expanded prend l'espace restant, poussant le bouton vers le bas
              // ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ConnexionButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
