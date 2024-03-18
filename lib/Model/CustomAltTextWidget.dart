import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulersan/contans/app_color.dart';

class CustomAltTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Function(bool)? onMouseEnter;
  final Function(bool)? onMouseExit;
  final VoidCallback? onTap;

  const CustomAltTextWidget({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.onMouseEnter,
    this.onMouseExit,
    this.onTap,
  });

  @override
  _CustomAltTextWidgetState createState() => _CustomAltTextWidgetState();
}

class _CustomAltTextWidgetState extends State<CustomAltTextWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
        if (widget.onMouseEnter != null) {
          widget.onMouseEnter!(true);
        }
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
        if (widget.onMouseExit != null) {
          widget.onMouseExit!(false);
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: isHovered ? AppColors.profilBackground : Colors.white,
          ),
        ),
      ),
    );
  }
}
