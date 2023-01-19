import 'package:flutter/material.dart';
import 'helper.dart';

void main() => runApp(const GameActivity());

class GameActivity extends StatefulWidget {
  const GameActivity({super.key});

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
        backgroundColor: scaffold_color,
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: cell_margin,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              // color: container_color,
              color: turn == "X" ? X_Color : O_Color,
              child: Text(
                "$turn turn",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: cell_margin,
              child: Column(
                children: [
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
                ],
              ),
            ),
            // Bottom Panel
            // Score Panel
            Container(
              color: score_panel_color,
              child: Column(
                children: [
                  ScoreContainer(
                    X_Color,
                    "X Score: $x_score",
                  ),
                  ScoreContainer(
                    O_Color,
                    "O Score: $o_score",
                  ),
                  // Restart Game
                  Container(
                    margin: cell_margin,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: themeColor,
                    child: TextButton(
                      onPressed: restart,
                      child: const Text(
                        "Restart",
                        style: score_container_style,
                      ),
                    ),
                  ),
                ],
              ),
            )
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
        loadTurn();
        played[num] = text;
        colors_pack[num] = color;

        for (var c in winningPositions) {
          if (c.contains(num) && checkWinner(c)) {
            game_won = true;
            changeColor(c);

            // break;
          }
        }
      },
    );
    if (game_won) {
      Future.delayed(
        Duration(seconds: showWinTime),
        resetBoard,
      );
      if (text == "X")
        x_score++;
      else
        o_score++;
    }
    if (game_won == false && play_count >= 9) {
      resetBoard();
    }
  }

  void loadTurn() {
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

  void changeColor(List<int> list) {
    for (int i in list) {
      colors_pack[i] = win_color;
    }
  }

  bool checkWinner(List<int> combo) {
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

  void resetBoard() {
    play_count = 0;
    game_won = false;
    setState(() {
      for (int index = 0; index < colors_pack.length; index++) {
        played[index] = "";
        colors_pack[index] = default_color;
      }
    });
  }

  void restart() {
    setState(() {
      x_score = 0;
      o_score = 0;
      resetBoard();
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: username,
            accountEmail: email,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/Akinyeleib.jpg"),
            ),
          ),
          const ListTile(
            title: Text("Title"),
            subtitle: Text("subtitle"),
            leading: Icon(Icons.person),
            // trailing: Icon(Icons.edit),
            // onTap: () {},
          ),
          ListTile(
            title: Text("Name"),
            subtitle: username,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: Text("email"),
            subtitle: email,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
