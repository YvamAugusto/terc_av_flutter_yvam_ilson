import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Color fontColor;
  final Color borderColor;
  final String text;

  const ButtonComponent({
    super.key, 
    required this.onPressed,
    required this.color,
    required this.fontColor,
    required this.borderColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: fontColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
