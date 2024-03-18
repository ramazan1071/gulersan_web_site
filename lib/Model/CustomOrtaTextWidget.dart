import 'package:flutter/material.dart';
// Özel widget sınıfı oluştur
class CustomOrtaTextWidget extends StatelessWidget {
  // Widget için gerekli olan verileri alacak constructor
  final String text;
  final double fontSize; // fontsize parametresi eklendi
  final FontWeight fontWeight; // fontWeight parametresi eklendi

  // Constructor'da gelen veriyi bu sınıfın text özelliğine atayacak
  CustomOrtaTextWidget({required this.text, this.fontSize = 20, this.fontWeight = FontWeight.bold}); // Default değer olarak FontWeight.bold atanır

  @override
  Widget build(BuildContext context) {
    // Text widget'ını döndüren build metodu
    return Text(
      text, // Alınan metni kullan
      style: TextStyle(
        // fontsize ve fontWeight kullanılır
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
      ),
    );
  }
}