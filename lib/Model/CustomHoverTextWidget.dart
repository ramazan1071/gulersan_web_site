import 'package:flutter/material.dart';

import '../contans/app_color.dart';

class CustomHoverTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Function(bool)? onHover; // onHover callback function
  final VoidCallback? onTap;
  final Function(bool)? onExit; // onExit callback function
  final double leftwid;

  CustomHoverTextWidget({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.onHover,
    this.onTap,
    this.onExit,
    required this.leftwid,
  });

  @override
  _CustomHoverTextWidgetState createState() => _CustomHoverTextWidgetState();
}

class _CustomHoverTextWidgetState extends State<CustomHoverTextWidget> {
  late String displayText;
  late bool isHovered;

  @override
  void initState() {
    super.initState();
    displayText = widget.text;
    isHovered = false;
  }

  void handleMouseEnter(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
    if (widget.onHover != null) {
      widget.onHover!(isHovered);
    }
  }

  void handleMouseExit(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
    if (widget.onExit != null) {
      widget.onExit!(isHovered);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (event) => handleMouseEnter(true),
      onExit: (event) => handleMouseExit(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.05, left: widget.leftwid),
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: isHovered ? AppColors.profilBackground : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
