import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onplayer = true;
  List<String> DisplayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int OhScore = 0;
  int exScore = 0;
  int FildBoxx = 0;
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PLayer O',
                        style: myNewFontWhite,
                      ),
                      Text(
                        OhScore.toString(),
                        style: myNewFontWhite,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PLayer X',
                        style: myNewFontWhite,
                      ),
                      Text(
                        exScore.toString(),
                        style: myNewFontWhite,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapeed(index);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Text(
                          DisplayExOh[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Center(
                child: Text(
              "TIK TAK TOE",
              style: myNewFontWhite,
            )),
          ))
        ],
      ),
    );
  }

  void _tapeed(int index) {
    setState(() {
      if (onplayer && DisplayExOh[index] == '') {
        DisplayExOh[index] = 'o';
        FildBoxx += 1;
      } else if (!onplayer && DisplayExOh[index] == '') {
        DisplayExOh[index] = 'x';
        FildBoxx += 1;
      }
      onplayer = !onplayer;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (DisplayExOh[0] == DisplayExOh[1] &&
        DisplayExOh[0] == DisplayExOh[2] &&
        DisplayExOh[0] != "") {
      _showWindilog(DisplayExOh[0]);
    }
    if (DisplayExOh[3] == DisplayExOh[4] &&
        DisplayExOh[3] == DisplayExOh[5] &&
        DisplayExOh[3] != "") {
      _showWindilog(DisplayExOh[3]);
    }
    if (DisplayExOh[6] == DisplayExOh[7] &&
        DisplayExOh[6] == DisplayExOh[8] &&
        DisplayExOh[6] != "") {
      _showWindilog(DisplayExOh[6]);
    }
    if (DisplayExOh[0] == DisplayExOh[3] &&
        DisplayExOh[0] == DisplayExOh[6] &&
        DisplayExOh[0] != "") {
      _showWindilog(DisplayExOh[0]);
    }
    if (DisplayExOh[1] == DisplayExOh[4] &&
        DisplayExOh[1] == DisplayExOh[7] &&
        DisplayExOh[1] != "") {
      _showWindilog(DisplayExOh[1]);
    }
    if (DisplayExOh[2] == DisplayExOh[5] &&
        DisplayExOh[2] == DisplayExOh[8] &&
        DisplayExOh[2] != "") {
      _showWindilog(DisplayExOh[2]);
    }
    if (DisplayExOh[0] == DisplayExOh[4] &&
        DisplayExOh[0] == DisplayExOh[8] &&
        DisplayExOh[0] != "") {
      _showWindilog(DisplayExOh[0]);
    }
    if (DisplayExOh[2] == DisplayExOh[4] &&
        DisplayExOh[2] == DisplayExOh[6] &&
        DisplayExOh[2] != "") {
      _showWindilog(DisplayExOh[2]);
    } else if (FildBoxx == 9) {
      show_drow();
    }
  }

  void show_drow() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: [
              TextButton(
                  onPressed: () {
                    _ClerBord();
                    Navigator.of(context).pop();
                  },
                  child: Text("PLay Again "))
            ],
          );
        });
  }

  void _showWindilog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS ' + winner),
            actions: [
              TextButton(
                  onPressed: () {
                    _ClerBord();
                    Navigator.of(context).pop();
                  },
                  child: Text("PLay Again "))
            ],
          );
        });
    if (winner == 'o') {
      OhScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _ClerBord() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          DisplayExOh[i] = '';
        }
      },
    );
    FildBoxx = 0;
  }
}
