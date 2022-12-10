import 'package:flutter/material.dart';
import 'helper.dart';

void main() => runApp(GameActivity());

class GameActivity extends StatefulWidget {
  GameActivity({super.key});

  @override
  State<GameActivity> createState() => _GameActivityState();
}

class _GameActivityState extends State<GameActivity> {
  String text = "X", turn = "X";
  String text1 = "", text2 = "", text3 = "";
  String text4 = "", text5 = "", text6 = "";
  String text7 = "", text8 = "", text9 = "";

  Color color1 = default_color, color2 = default_color, color3 = default_color;
  Color color4 = default_color, color5 = default_color, color6 = default_color;
  Color color7 = default_color, color8 = default_color, color9 = default_color;

  var played = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.amber,
              child: Text(
                "$turn turn",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            // FIrst Row
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: clicked1,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      color: color1,
                      child: Text(
                        played[0],
                        style: cell_style,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked2,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      color: color2,
                      child: Text(
                        played[1],
                        style: cell_style,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked3,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      color: color3,
                      child: Text(
                        played[2],
                        style: cell_style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clicked() {
    setState(
      () {
        load_turn();
      },
    );
  }

  void load_turn() {
    text = turn;
    if (turn == "O") {
      color = O_Color;
      turn = "X";
    } else {
      color = X_Color;
      turn = "O";
    }
  }

  void clicked1() {
    if (played[0] != "") return;
    clicked();
    played[0] = text;
    color1 = color;
  }

  void clicked2() {
    if (played[1] != "") return;
    clicked();
    played[1] = text;
    color2 = color;
  }

  void clicked3() {
    if (played[2] != "") return;
    clicked();
    played[2] = text;
    color3 = color;
  }
}
