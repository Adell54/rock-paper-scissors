import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock-Paper-Scissors',
      debugShowCheckedModeBanner: false,
      home: RockPaperScissorsScreen(),
    );
  }
}

class RockPaperScissorsScreen extends StatefulWidget {
  @override
  _RockPaperScissorsScreenState createState() =>
      _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  // Emojis for each choice
  final Map<String, String> choiceEmojis = {
    'Rock': '✊',
    'Paper': '✋',
    'Scissors': '✌️',
  };


  final List<String> choices = ['Rock', 'Paper', 'Scissors'];


  String playerChoice = '';
  String computerChoice = '';


  int playerScore = 0;
  int computerScore = 0;


  final _random = Random();

  // When user picks a gesture
  void playGame(String userPick) {
    setState(() {
      playerChoice = userPick;
      computerChoice = choices[_random.nextInt(choices.length)];
      _updateScores();
    });
  }


  void _updateScores() {
    if (playerChoice == computerChoice) {

      return;
    }


    if ((playerChoice == 'Rock' && computerChoice == 'Scissors') ||
        (playerChoice == 'Scissors' && computerChoice == 'Paper') ||
        (playerChoice == 'Paper' && computerChoice == 'Rock')) {
      playerScore++;
    } else {
      computerScore++;
    }
  }


  void _resetGame() {
    setState(() {
      playerChoice = '';
      computerChoice = '';
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: Text('Let\'s Play Rock-Paper-Scissors'),
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'You: ${playerChoice.isEmpty ? '?' : choiceEmojis[playerChoice]}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Computer: ${computerChoice.isEmpty ? '?' : choiceEmojis[computerChoice]}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: choices.map((choice) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12), backgroundColor: Colors.blue.shade700,
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => playGame(choice),
                    child: Text(choiceEmojis[choice]!),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),

            // Score display
            Text(
              'Your Score: $playerScore    Computer Score: $computerScore',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20),


            IconButton(
              iconSize: 35,
              color: Colors.white,
              icon: Icon(Icons.refresh),
              onPressed: _resetGame,
              tooltip: 'Reset Game',
            ),
          ],
        ),
      ),
    );
  }
}
