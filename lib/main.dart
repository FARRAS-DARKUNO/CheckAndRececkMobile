import 'package:checking_stock/views/pages/beranda/beranda_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Yakena',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BerandaPage(),
      );
  }
}