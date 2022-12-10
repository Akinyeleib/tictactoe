import 'package:flutter/material.dart';
import 'helper.dart';

void main() => runApp(GameActivity());

class GameActivity extends StatefulWidget {
  GameActivity({super.key});

  @override
  State<GameActivity> createState() => _GameActivityState();
}

class _GameActivityState extends State<GameActivity> {
  String text = "X";
  String turn = "X";

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
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Text(
                      text,
                      style: cell_style,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        text,
                        style: cell_style,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        text,
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
        // print("turn is $turn");
      },
    );
  }

  void load_turn() {
    if (turn == "O") {
      text = turn;
      turn = "X";
    } else {
      text = turn;
      turn = "O";
    }
  }
}
