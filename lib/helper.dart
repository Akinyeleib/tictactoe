import 'package:flutter/material.dart';

const String appTitle = "Simple Tic Tac Toe Game";
const EdgeInsets cell_margin = EdgeInsets.all(5);
const TextStyle cell_style = TextStyle(
  color: Colors.white,
  fontSize: 30,
);

double my_height = 100;

Color X_Color = Colors.blue;
Color O_Color = Colors.brown;
Color color = Colors.black;
Color default_color = Colors.grey;
Color win_color = Colors.green;
MaterialColor themeColor = Colors.purple;

List<List<int>> winning_positions = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [6, 3, 0],
  [7, 4, 1],
  [5, 8, 2],
  [0, 4, 8],
  [6, 4, 2]
];
