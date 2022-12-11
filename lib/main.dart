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

  int play_count = 0, num = 0, x_score = 0, o_score = 0;
  bool game_won = false;

  Color color1 = default_color, color2 = default_color, color3 = default_color;
  Color color4 = default_color, color5 = default_color, color6 = default_color;
  Color color7 = default_color, color8 = default_color, color9 = default_color;

  var played = ["", "", "", "", "", "", "", "", ""];
  List<Color> colors_pack = [
    default_color,
    default_color,
    default_color,
    default_color,
    default_color,
    default_color,
    default_color,
    default_color,
    default_color
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: themeColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: cell_margin,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: container_color,
              child: Text(
                "$turn turn",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // First Row
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: clicked1,
                    child: MyContainer(
                      played[0],
                      (colors_pack[0]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked2,
                    child: MyContainer(
                      played[1],
                      (colors_pack[1]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked3,
                    child: MyContainer(
                      played[2],
                      (colors_pack[2]),
                    ),
                  ),
                ),
              ],
            ),
            // Second Row
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: clicked4,
                    child: MyContainer(
                      played[3],
                      (colors_pack[3]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked5,
                    child: MyContainer(
                      played[4],
                      (colors_pack[4]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked6,
                    child: MyContainer(
                      played[5],
                      (colors_pack[5]),
                    ),
                  ),
                ),
              ],
            ),
            // Third Row
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: clicked7,
                    child: MyContainer(
                      played[6],
                      (colors_pack[6]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked8,
                    child: MyContainer(
                      played[7],
                      (colors_pack[7]),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: clicked9,
                    child: MyContainer(
                      played[8],
                      (colors_pack[8]),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: cell_margin,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: X_Color,
              child: Text(
                "X Score: $x_score",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: cell_margin,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: O_Color,
              child: Text(
                "O Score: $o_score",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clicked() {
    if (played[num] != "" || game_won) return;
    play_count++;
    setState(
      () {
        load_turn();
        played[num] = text;
        colors_pack[num] = color;

        for (var c in winning_positions) {
          if (c.contains(num) && check_winner(c)) {
            game_won = true;
            colors_pack[c[0]] = win_color;
            colors_pack[c[1]] = win_color;
            colors_pack[c[2]] = win_color;
            if (played[c[0]] == "X")
              x_score++;
            else
              o_score++;
            break;
          }
        }
      },
    );
    if (game_won || play_count >= 9) {
      reset_board();
    }
  }

  void load_turn() {
    text = turn;
    if (turn == "O") {
      color = O_Color;
      turn = "X";
      container_color = X_Color;
    } else {
      color = X_Color;
      turn = "O";
      container_color = O_Color;
    }
  }

  bool check_winner(List<int> combo) {
    String one = played[combo[0]];
    String two = played[combo[1]];
    String three = played[combo[2]];

    return one == two && two == three;
  }

  void clicked1() {
    num = 0;
    clicked();
  }

  void clicked2() {
    num = 1;
    clicked();
  }

  void clicked3() {
    num = 2;
    clicked();
  }

  void clicked4() {
    num = 3;
    clicked();
  }

  void clicked5() {
    num = 4;
    clicked();
  }

  void clicked6() {
    num = 5;
    clicked();
  }

  void clicked7() {
    num = 6;
    clicked();
  }

  void clicked8() {
    num = 7;
    clicked();
  }

  void clicked9() {
    num = 8;
    clicked();
  }

  void reset_board() {
    play_count = 0;
    game_won = false;
    for (int index = 0; index < colors_pack.length; index++) {
      played[index] = "";
      colors_pack[index] = default_color;
    }
  }
}
