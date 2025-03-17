import 'package:flutter/material.dart';

class WelcomeBox extends StatefulWidget {
  final Widget child;

  const WelcomeBox({super.key, required this.child});

  @override
  WelcomeBoxState createState() => WelcomeBoxState();
}

class WelcomeBoxState extends State<WelcomeBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: widget.child,
      ),
    );
  }
}
