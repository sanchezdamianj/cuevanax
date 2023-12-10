import 'package:cuevanax/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: childView,
        bottomNavigationBar: const CustomBottomNavigation());
  }
}
