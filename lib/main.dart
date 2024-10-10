import 'package:flutter/material.dart';
import 'package:test_front/TimeSliderPage.dart';
import 'package:test_front/buy_screen.dart';
import 'package:test_front/discover_more.dart';
import 'package:test_front/task_quiz_2.dart';
import 'package:test_front/task_quiz_images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: OldTownStoryPage(),
    );
  }
}
// backgroundColor: const Color.fromRGBO(159, 112, 255, 0.95),