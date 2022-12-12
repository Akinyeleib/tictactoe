import 'package:flutter/material.dart';

const String appTitle = "Tic Tac Toe";
const EdgeInsets cell_margin = EdgeInsets.all(5);
const TextStyle cell_style = TextStyle(
  color: Colors.white,
  fontSize: 30,
);

const TextStyle score_container_style = TextStyle(
  fontSize: 25,
  color: Colors.white,
);

double my_height = 100;

Color X_Color = Color.fromARGB(255, 28, 27, 27);
Color O_Color = Color.fromARGB(255, 159, 17, 7);
Color color = Colors.black;
Color default_color = Colors.grey;
Color win_color = Colors.green;
MaterialColor themeColor = Colors.teal;
Color container_color = Color.fromARGB(255, 142, 143, 146);
Color scaffold_color = Colors.white;
Color score_panel_color = Color.fromARGB(255, 9, 10, 10);

List<List<int>> winningPositions = [
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

class ScoreContainer extends StatelessWidget {
  Color cont_color;
  String cont_text;
  ScoreContainer(this.cont_color, this.cont_text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cell_margin,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      color: cont_color,
      child: Text(
        cont_text,
        style: score_container_style,
      ),
    );
  }
}
