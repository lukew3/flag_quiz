import 'dart:ffi';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _questionNumber = 0;
  bool _guessing = true;

  _submitGuess(String guess) {
    print("Guess: $guess");
    setState(() {
      _guessing = false;
    });
  }

  _nextGuess() {
    print('Next guess');
    setState(() {
      _guessing = true;
      _questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_guessing) {
      return Scaffold(
        body: Column(
          children: <Widget>[
            const GameHeader(),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(60),
                child: Image(
                  image: AssetImage('assets/flag_usa.png'),
                  width: 500,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Country Name',
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.white),
                        onSubmitted: _submitGuess,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: _nextGuess,
        child: Scaffold(
          body: Column(
            children: const <Widget>[
              GameHeader(),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
                  child: Image(
                    image: AssetImage('assets/flag_usa.png'),
                    width: 500,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'United States of America',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
                  child: Image(
                    image: AssetImage('assets/correct.png'),
                    width: 60,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'United States of America is Correct!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 20),
                  child: Text(
                    'Press anywhere to continue...',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class GameHeader extends StatelessWidget {
  const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text(
            'Flag Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            '1/195',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
