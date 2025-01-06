import 'package:flutter/material.dart';
import '../theme.dart';

class AwaitAddingFund extends StatelessWidget {
  final VoidCallback? onPressed;

  const AwaitAddingFund({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);
    return Scaffold(
      backgroundColor: customColor.getColor("surfaceContainerLowest"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: mediaQuery.height / 2.2),
          // Roue de chargement avec animation
          Align(
            alignment: Alignment.center,
            child: _RotatingImage(
              assetPath: 'assets/images/loading_wheel.png',
              size: 48.0,
              duration: const Duration(seconds: 1),
            ),
          ),
          const SizedBox(height: 12),
          // Texte "En attente de nomResto"
          Align(
            alignment: Alignment.center,
            child: Text(
              'Ajout de fonds en cours',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RotatingImage extends StatefulWidget {
  final String assetPath;
  final double size;
  final Duration duration;

  const _RotatingImage({
    required this.assetPath,
    required this.size,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  State<_RotatingImage> createState() => _RotatingImageState();
}

class _RotatingImageState extends State<_RotatingImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        widget.assetPath,
        height: widget.size,
        fit: BoxFit.contain,
      ),
    );
  }
}
