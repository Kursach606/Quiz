import 'dart:math';

import 'package:flutter/material.dart';

// 4 окно
class QuizTimePage extends StatefulWidget {
  const QuizTimePage({super.key});

  @override
  State<QuizTimePage> createState() => _QuizTimePageState();
}

class _QuizTimePageState extends State<QuizTimePage> {
  int? _selectedOptionIndex;

  // Функция для выбора варианта
  void _onOptionSelected(int index) {
    setState(() {
      _selectedOptionIndex = index;
    });
  }

  // Функция для отображения всплывающего окна с текстовым полем
  void _showAnswerDialog(double screenWidth, double screenHeight,
      double Function(double) scaleText) {
    if (_selectedOptionIndex != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'What would you take with you?',
              style: TextStyle(
                fontSize: scaleText(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              decoration: InputDecoration(
                hintText: 'Type your answer',
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(159, 112, 255, 0.95),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.02,
                    ),
                    textStyle: TextStyle(
                      fontSize: scaleText(18),
                    ),
                  ),
                  child: const Text(
                    'Answer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Функция для масштабирования размера текста
    double scaleText(double baseSize) {
      return baseSize * (screenWidth / 375); // 375 - базовая ширина экрана
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 213, 233).withOpacity(1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: screenWidth * 0.05,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Old town story',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: scaleText(17)),
            ),
            SizedBox(width: screenWidth * 0.04),
            SizedBox(
              height: screenWidth * 0.08,
              width: screenWidth * 0.08,
              child: CustomPaint(
                painter: ProgressPainter(progress: 0.2),
                child: Center(
                  child: Text(
                    '20%',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: scaleText(13),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF8437FF), // Цвет фона кнопки share
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Quiz time!',
                    style: TextStyle(
                      fontSize: scaleText(24),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'What would you bring with you to surprise the people of the past and leave your mark on history?',
                    style: TextStyle(
                      fontSize: scaleText(16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildQuizOption(
                    0,
                    'Smartphone',
                    'to show how easy it is to resolve disputes now: OpenAI, chatgpt, etc.',
                    'assets/smartphone.jpg',
                    onTap: () => _onOptionSelected(0),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    scaleText: scaleText,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildQuizOption(
                    1,
                    'Smartwatches',
                    'to show you\'re retracing your steps even in the Middle Ages.',
                    'assets/smartwatch.jpg',
                    onTap: () => _onOptionSelected(1),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    scaleText: scaleText,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildQuizOption(
                    2,
                    'Avocado toast',
                    'to explain that this is the breakfast of the future!',
                    'assets/avocado_toast.jpg',
                    onTap: () => _onOptionSelected(2),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    scaleText: scaleText,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildQuizOption(
                    3,
                    'Your idea',
                    'Choose and add your personal answer.',
                    'assets/lightbulb.jpg',
                    onTap: () => _onOptionSelected(3),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    scaleText: scaleText,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: ElevatedButton(
                      onPressed: _selectedOptionIndex != null
                          ? () => _showAnswerDialog(
                              screenWidth, screenHeight, scaleText)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(159, 112, 255, 0.95),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                          vertical: screenHeight * 0.02,
                        ),
                        textStyle: TextStyle(
                          fontSize: scaleText(18),
                        ),
                      ),
                      child: const Text(
                        'Answer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {},
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.purple),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Функция для построения варианта викторины
  Widget _buildQuizOption(
    int index,
    String title,
    String description,
    String imageAsset, {
    required VoidCallback onTap,
    required double screenWidth,
    required double screenHeight,
    required double Function(double) scaleText,
  }) {
    bool isSelected = _selectedOptionIndex == index;
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius:
            isSelected ? BorderRadius.circular(100) : BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isSelected
                ? BorderRadius.circular(100)
                : BorderRadius.circular(16),
            border: isSelected
                ? Border.all(
                    color: const Color.fromARGB(255, 221, 67, 221)
                        .withOpacity(0.7),
                    width: 7,
                  )
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color.fromARGB(255, 142, 81, 153)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  imageAsset,
                  height: screenWidth * 0.2,
                  width: screenWidth * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: scaleText(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: scaleText(14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(159, 112, 255, 0.95).withOpacity(0.5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);

    final arcPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
