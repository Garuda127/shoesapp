import 'package:flutter/material.dart';

class BotonNaraja extends StatelessWidget {
  final Color color;
  final String texto;
  final double height;
  final double width;
  const BotonNaraja(
      {super.key,
      required this.texto,
      this.height = 50,
      this.width = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
      child: Text(
        texto,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
