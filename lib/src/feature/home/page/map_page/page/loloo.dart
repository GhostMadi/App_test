import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class LiloPage extends StatefulWidget {
  const LiloPage({super.key});

  @override
  State<LiloPage> createState() => _LiloPageState();
}

class _LiloPageState extends State<LiloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('liko')),);
  }
}