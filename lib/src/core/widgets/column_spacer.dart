import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  final double column;
  const ColumnSpacer(this.column,{super.key});

  @override
  Widget build(BuildContext context) =>SizedBox(height: column*10);
}