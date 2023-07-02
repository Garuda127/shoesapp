import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/pages/zapato_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ZapatoModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ZapatoPage(),
    );
  }
}
