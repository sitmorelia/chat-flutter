import 'package:flutter/material.dart';

class AppTheme {
  final Map<String, Color> _colorsTheme = {
    "custom": Color(0xFFA5419B),
    "1": Colors.teal,
    "2": Colors.yellow,
    "3": Colors.blue,
    "4": Colors.green,
  };
  final String selectedColor;

  AppTheme({this.selectedColor = 'custom'}) {
    assert(_colorsTheme.containsKey(selectedColor), 'Invalid color key');
  }

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsTheme[selectedColor],
    );
  }
}
