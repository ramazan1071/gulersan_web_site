import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomButton({
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
        padding: EdgeInsets.symmetric(vertical: screenWidth*0.011, horizontal: screenWidth*0.016),
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
              style: TextStyle(fontSize: screenWidth*0.011),
            ),
            SizedBox(width: screenWidth*0.005), // İkon ile metin arasında boşluk bırak
            Icon(icon), // Düğme ikonu
          ],
        ),
      ),
    );
  }
}
