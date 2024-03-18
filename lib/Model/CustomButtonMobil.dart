import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonMobil extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomButtonMobil({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Köşeleri kare yap
          side: BorderSide(color: buttonColor), // Kenar rengi
        ),
        padding: EdgeInsets.symmetric(vertical: screenWidth*0.001, horizontal: screenWidth*0.001),
        primary: buttonColor, // Düğmenin arka plan rengi
        onPrimary: Colors.white, // Düğme metin rengi
      ),
      child: Padding(
        padding:  EdgeInsets.all(screenWidth*0.006),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: screenWidth*0.015),
            ),
            SizedBox(width: screenWidth*0.005), // İkon ile metin arasında boşluk bırak
            Icon(icon), // Düğme ikonu
          ],
        ),
      ),
    );
  }
}
