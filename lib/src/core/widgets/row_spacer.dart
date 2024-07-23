import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  final double row;
  const RowSpacer(this.row,{super.key});

  @override
  Widget build(BuildContext context) =>SizedBox(width: row*10);
}