import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final String text;
  final int? maxLine;

  CustomText(this.text,
      {this.width,
      this.height,
      this.fontSize,
      this.fontWeight,
      this.color = Colors.white,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          text,
          maxLines: maxLine,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color),
        ),
      ),
    );
  }
}
