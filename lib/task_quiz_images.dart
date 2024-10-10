import 'dart:math';
import 'package:flutter/material.dart';
// 3 окно

class TaskQuiz extends StatelessWidget {
  const TaskQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Функция для масштабирования размера текста
    double scaleText(double baseSize) {
      return baseSize * (screenWidth / 375); // 375 - базовая ширина экрана
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224)
          .withOpacity(1), // Еле заметный розовый фон
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
                fontSize: scaleText(18),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            // Загрузка
            SizedBox(
              height: screenWidth * 0.075, // Увеличенный размер круга
              width: screenWidth * 0.075, // Увеличенный размер круга
              child: CustomPaint(
                painter: ProgressPainter(progress: 0.2),
                child: Center(
                  child: Text(
                    '20%',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: scaleText(10),
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
              decoration: BoxDecoration(
                color: const Color.fromRGBO(159, 112, 255, 0.95)
                    .withOpacity(1), // фон кнопки
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share,
                    color: Colors.white), // Белый цвет иконки
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Центрирование текста
          children: [
            SizedBox(height: screenHeight * 0.025),
            Text(
              'Quiz time!',
              style: TextStyle(
                fontSize: scaleText(24),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Центрирование текста
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Why is there a picture of a key next to the cathedral’s name?',
              style: TextStyle(fontSize: scaleText(15)),
              textAlign: TextAlign.center, // Центрирование текста
            ),
            SizedBox(height: screenHeight * 0.025),
            Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.00625),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white, // Белый фон
                borderRadius: BorderRadius.circular(13), // Закругленные углы
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0), // Уменьшенный отступ слева
                    leading: Radio(
                      value: 1,
                      groupValue: 3,
                      onChanged: (value) {},
                    ),
                    title: Text(
                      'The monks didn’t make beer, but made keys for the monastery.',
                      style: TextStyle(fontSize: scaleText(15)),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0), // Уменьшенный отступ слева
                    leading: Radio(
                      value: 2,
                      groupValue: 3,
                      onChanged: (value) {},
                    ),
                    title: Text(
                      'The monks were kind and gave everyone a key so they could come in anytime.',
                      style: TextStyle(fontSize: scaleText(15)),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0), // Уменьшенный отступ слева
                    leading: Radio(
                      value: 3,
                      groupValue: 3,
                      onChanged: (value) {},
                    ),
                    title: Text(
                      'The key is a symbol of Saint Peter, who Jesus gave the keys to Heaven.',
                      style: TextStyle(fontSize: scaleText(15)),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0), // Уменьшенный отступ слева
                    leading: Radio(
                      value: 4,
                      groupValue: 3,
                      onChanged: (value) {},
                    ),
                    title: Text(
                      'The key shows a secret way to catacombs under the cathedral.',
                      style: TextStyle(fontSize: scaleText(15)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(159, 112, 255, 0.95),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.08,
                  ),
                  textStyle: TextStyle(
                    fontSize: scaleText(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Белый цвет текста
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Answer',
                  style: TextStyle(color: Colors.white), // Белый цвет текста
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.045),
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
                  colors: [Colors.purple, Colors.orange], // Градиентный фон
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search,
                    color: Colors.white), // Белый цвет иконки
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
      ..color = Colors.black.withOpacity(1)
      ..strokeWidth = 1.5
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
