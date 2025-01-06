import 'package:flutter/material.dart';
import '../components/connexion_button.dart';
import '../components/ridee_info.dart';
import '../components/caree_info.dart';
import '../components/foodee_info.dart';
import '../components/packee_info.dart';
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
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;

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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customColor = ColorManager(context);
    appBarColor = customColor.getColor("surfaceContainerLowest");
    bodyColor = customColor.getColor("surfaceContainerLowest");
  }
  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 10
        ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
        : customColor.getColor("surfaceContainerLowest");
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: colorScheme.onSurfaceVariant,), // Flèche "Retour"
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
                    if(widget.idService==1) CareeInfo(),
                    if(widget.idService==2) FoodeeInfo(),
                    if(widget.idService==3) PackeeInfo(),
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
