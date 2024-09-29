import 'package:flutter/material.dart';
import 'temperature_conversion_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 107, 33, 243),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TemperatureConversionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
