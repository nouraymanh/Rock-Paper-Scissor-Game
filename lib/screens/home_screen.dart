import 'dart:math';
import 'package:flutter/material.dart';
import '../components/my_text.dart';
import '../enums/game_enum.dart';
import '../enums/result_enum.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GameEnum? userChoice;
  GameEnum? computerChoice;
  ResultEnum? finalResult;

  List cpuSelections = [
    GameEnum.rock,
    GameEnum.paper,
    GameEnum.scissor,
  ];
   int userScore=0;
   int compScore=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1b2b4c),
        body: userChoice == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText('Rock'),
                  MyText('Paper'),
                  MyText('Scissors'),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Pick your weapon',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = GameEnum.rock;
                        userScore++;
                      });
                      makeComputerSelect();
                      calculations();
                    },
                    child: Image.asset(
                      'assets/images/rock.png',
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = GameEnum.paper;
                      });
                      makeComputerSelect();
                      calculations();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/paper.png',
                        height: 100,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = GameEnum.scissor;
                      });
                      makeComputerSelect();
                      calculations();
                    },
                    child: Image.asset(
                      'assets/images/scissor.png',
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Player',
                              style: TextStyle(color: Colors.white),
                            ),
                            MyText('$userScore')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'CPU',
                              style: TextStyle(color: Colors.white),
                            ),
                            MyText('$compScore')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            : GestureDetector(onTap: (){
              Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
              child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(finalResult!.name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'User',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Image.asset(
                              'assets/images/${userChoice!.name}.png',
                              height: 100,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'CPU',
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                              'assets/images/${computerChoice!.name}.png',
                              height: 100,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
            ));
  }

  calculations() {
    // if user select rock
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.lose;
        compScore++;
      });
    }
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.win;
        userScore++;
      });
    }

    // if user select paper

    if (userChoice == GameEnum.paper && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
    if (userChoice == GameEnum.paper && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.lose;
        compScore++;
      });
    }
    if (userChoice == GameEnum.paper && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.win;
        userScore++;
      });
    }

    // if user select scissor
    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.win;
        userScore++;
      });
    }

    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.lose;
        compScore++;
      });
    }

    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
  }

  makeComputerSelect() {
    setState(() {
      Random random = Random();
      int selected = random.nextInt(3);
      computerChoice = cpuSelections[selected];
    });
  }
}
