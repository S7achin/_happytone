// ignore_for_file: prefer_const_constructors

import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard%20functions/quiz.dart';
import 'package:flutter/material.dart';

class TestResult extends StatefulWidget {
  final int score;
  const TestResult(this.score, {super.key});

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Text(
                  "Congratulations",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "You are",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 40),
              Text(
                "${widget.score}%",
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Healthy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Be with us continuously for your better improvement",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 60),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizPage()));
                },
                color: Colors.orange,
                child: const Text("Repeat the Test"),
              )
            ]),
      ),
    );
  }
}
