import 'package:flutter/material.dart';

const String appTitle = "Tic Tac Toe";
const EdgeInsets cell_margin = EdgeInsets.all(5);
const TextStyle cell_style = TextStyle(
  color: Colors.white,
  fontSize: 30,
);

double my_height = 100;

Color X_Color = Colors.blue;
Color O_Color = Colors.amber;
Color color = Colors.black;
Color default_color = Colors.grey;
Color win_color = Colors.green;
MaterialColor themeColor = Colors.purple;
Color container_color = Colors.amber;

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

class MyContainer extends StatelessWidget {
  String theText;
  Color the_color;
  MyContainer(this.theText, this.the_color, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: my_height,
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      color: the_color,
      child: Text(
        theText,
        style: cell_style,
      ),
    );
  }
}
