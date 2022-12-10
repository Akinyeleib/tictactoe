import 'package:flutter/material.dart';

void main() => runApp(const GameActivity());

class GameActivity extends StatefulWidget {
  const GameActivity({super.key});

  @override
  State<GameActivity> createState() => _GameActivityState();
}

class _GameActivityState extends State<GameActivity> {
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
              padding: EdgeInsets.all(20),
              child: Text(
                "X or O turn",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                ),
              ),
              alignment: Alignment.center,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
