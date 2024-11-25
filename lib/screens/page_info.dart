import 'package:flutter/material.dart';
import '../components/connexion_button.dart';
import '../components/ridee_info.dart';
import '../components/foodee_info.dart';
import '../theme.dart';

class PageInfo extends StatefulWidget {
  final int idService;

  const PageInfo({
    Key? key,
    this.idService = 0, 
    // Valeur par défaut
  }) : super(key: key);

  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(widget.idService==0) RideeInfo(),
              if(widget.idService==1) FoodeeInfo(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.085),
              Align(
                alignment: Alignment.bottomLeft,
                child: ConnexionButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
