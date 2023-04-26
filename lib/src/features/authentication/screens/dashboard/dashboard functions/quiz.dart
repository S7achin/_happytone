// ignore_for_file: prefer_final_fields, sort_child_properties_last

import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/features/authentication/models/dashboard/result_screen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import '../../../models/dashboard/question_list.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = const Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(sDefaultSize),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) => setState(() => isPressed = false),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1} /${questions.length}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 28.0),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  questions[index].question!,
                  style: const TextStyle(color: Colors.white, fontSize: 28.0),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              }
                            },
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  // Get.to(() => const TestResult(score));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TestResult(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.linear);
                                }
                          : null,
                      color: Colors.orange,
                      child: Text(
                        index + 1 == questions.length
                            ? "See Results"
                            : "Next Question",
                        style: const TextStyle(color: Colors.white),
                      ),
                      shape: const StadiumBorder(),
                    ),
                    //   OutlinedButton(
                    //       onPressed: isPressed
                    //           ? index + 1 == questions.length
                    //               ? () {
                    //                   // Get.to(() => const TestResult(score));
                    //                   Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               TestResult(score)));
                    //                 }
                    //               : () {
                    //                   _controller!.nextPage(
                    //                       duration:
                    //                           const Duration(milliseconds: 1),
                    //                       curve: Curves.linear);
                    //                 }
                    //           : null,
                    //       child: Text(
                    //         index + 1 == questions.length
                    //             ? "See Results"
                    //             : "Next Question",
                    //         style: const TextStyle(color: Colors.white),
                    //       )),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
