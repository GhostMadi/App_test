// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';

class MapElement extends StatefulWidget {
  final int index;
  final String svgIcon;
  final int count;
  final String title;
  final int selected;
  final int sumArea;
  final ValueChanged<int> onTap;

  const MapElement({
    super.key,
    required this.selected,
    required this.title,
    required this.sumArea,
    required this.index,
    required this.svgIcon,
    required this.count,
    required this.onTap,
  });

  @override
  State<MapElement> createState() => _MapElementState();
}

class _MapElementState extends State<MapElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.index),
      child: Container(
        width: 163,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4), topLeft: Radius.circular(4))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                widget.svgIcon,
                color: widget.selected == widget.index
                    ? AppColors.primary500
                    : AppColors.text600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppStyle.text900,
                ),
                Text(
                  '${widget.count} полей, ${widget.sumArea} га',
                  style: AppStyle.text900.copyWith(
                    color: AppColors.text600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
