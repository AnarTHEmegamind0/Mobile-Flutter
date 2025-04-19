import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class ShooOrhilt extends StatefulWidget {
  const ShooOrhilt({super.key});
  @override
  State<ShooOrhilt> createState() => _ShooOrhiltState();
}

class _ShooOrhiltState extends State<ShooOrhilt> {
  var currentDiceRoll = 1;
  int? player1Guess;
  int? player2Guess;

  void setGuess(int player, int guess) {
    setState(() {
      if (player == 1) {
        player1Guess = guess;
      } else {
        player2Guess = guess;
      }
    });
  }

  void rollDiceAndCheck(BuildContext context) {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;

      String message = 'Ялагч алга. 😅';
      if (player1Guess == currentDiceRoll && player2Guess == currentDiceRoll) {
        message = '2 тоглогч хоёулаа таалаа! 🥳';
      } else if (player1Guess == currentDiceRoll) {
        message = 'Тоглогч 1 яллаа! 🎉';
      } else if (player2Guess == currentDiceRoll) {
        message = 'Тоглогч 2 яллаа! 🎉';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, textAlign: TextAlign.center),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  Widget buildGuessButtons(int playerNumber) {
    return Row(
      children: List.generate(6, (index) {
        final guess = index + 1;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextButton(
            onPressed: () => setGuess(playerNumber, guess),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: Text('$guess'),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Transform.rotate(
            angle: 3.141592, // 180 degrees in radians
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    buildGuessButtons(1),
                    if (player1Guess != null)
                      Text(
                        "Сонгосон: $player1Guess",
                        style: const TextStyle(color: Colors.white),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: 3.141592, // 180 degrees in radians
            child: TextButton(
              onPressed:
                  player1Guess != null && player2Guess != null
                      ? () => rollDiceAndCheck(context)
                      : null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: const Text("Шоог орхих"),
            ),
          ),

          const SizedBox(height: 30),
          Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),
          const SizedBox(height: 20),
          TextButton(
            onPressed:
                player1Guess != null && player2Guess != null
                    ? () => rollDiceAndCheck(context)
                    : null,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text("Шоог орхих"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  buildGuessButtons(2),
                  if (player2Guess != null)
                    Text(
                      "Сонгосон: $player2Guess",
                      style: const TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
