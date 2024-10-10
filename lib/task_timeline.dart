import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// 2 окно
class ChallengeTimeScreen extends StatefulWidget {
  const ChallengeTimeScreen({super.key});

  @override
  _ChallengeTimeScreenState createState() => _ChallengeTimeScreenState();
}

class _ChallengeTimeScreenState extends State<ChallengeTimeScreen> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Функция для масштабирования размера текста
    double scaleText(double baseSize) {
      return baseSize * (screenWidth / 375); // 375 - базовая ширина экрана
    }

    return Scaffold(
      extendBodyBehindAppBar: true, // Растягиваем тело за AppBar
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: scaleText(20),
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
                      color: Colors.white,
                      fontSize: scaleText(12),
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
                    .withOpacity(1), // Слабо фиолетовый фон
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.black54, // Уменьшаем яркость
                    BlendMode.saturation,
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Мягкие углы для картинки
                    child: Image.asset(
                      'assets/back.jpg', // Используйте путь к вашему изображению
                      fit: BoxFit.cover,
                      height:
                          screenHeight * 0.4, // Установите высоту изображения
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom:
                      screenHeight * 0.05, // Отступ от нижней части изображения
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: CustomSlider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom:
                      screenHeight * 0.01, // Отступ от нижней части изображения
                  left: screenWidth * 0.09,
                  right: screenWidth * 0.09,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth *
                            0.025), // Уменьшенный отступ слева и справа
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1158',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scaleText(14),
                              fontWeight: _sliderValue == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        SizedBox(
                            width: screenWidth * 0.01), // Уменьшенный отступ
                        Text(
                          '1656',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scaleText(14),
                              fontWeight: _sliderValue == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        SizedBox(
                            width: screenWidth * 0.01), // Уменьшенный отступ
                        Text(
                          '1838',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scaleText(14),
                              fontWeight: _sliderValue == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        SizedBox(
                            width: screenWidth * 0.01), // Уменьшенный отступ
                        Text(
                          'Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scaleText(14),
                              fontWeight: _sliderValue == 3
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.025),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: screenHeight * 0.025), // Добавили отступ сверху
                  Text(
                    'Challenge time!',
                    style: TextStyle(
                      fontSize: scaleText(24),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'See how a Marienplaz has changed over time using the time slider. When the market was formed? Stop on correct period and submit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: scaleText(16)),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(159, 112, 255, 0.95),
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
                        borderRadius: BorderRadius.circular(
                            20), // Скругление углов кнопки
                      ),
                    ),
                    child: const Text(
                      'Answer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight * 0.025), // Добавили отступ снизу
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.0375),
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

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _dragValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final screenWidth = MediaQuery.of(context).size.width;
        final newValue = (details.localPosition.dx / screenWidth) * 3;
        setState(() {
          _dragValue = newValue.clamp(0.0, 3.0);
        });
      },
      onHorizontalDragEnd: (details) {
        final points = [0.0, 1.0, 2.0, 3.0];
        final closestPoint = points.reduce(
            (a, b) => (_dragValue - a).abs() < (_dragValue - b).abs() ? a : b);
        widget.onChanged(closestPoint);
        setState(() {
          _dragValue = closestPoint;
        });
      },
      child: CustomPaint(
        painter: _SliderPainter(value: _dragValue),
        child: Container(
          height: 25,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class _SliderPainter extends CustomPainter {
  final double value;

  _SliderPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    final inactivePaint = Paint()
      ..color = const Color.fromARGB(153, 255, 255, 255)
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    final thumbPaint = Paint()
      ..color = const Color.fromRGBO(159, 112, 255, 0.95)
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    const thumbRadius = 15.0;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, inactivePaint);

    final activeEndPoint = Offset(size.width * (value / 3), size.height / 2);
    canvas.drawLine(startPoint, activeEndPoint, paint);

    // Исправленный центр ползунка
    final thumbCenter =
        Offset(size.width * (value / 3) - thumbRadius / 2, size.height / 2);
    canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);

    // Draw points
    final points = [0.0, 1.0, 2.0, 3.0];
    const pointRadius = 5.0;
    final pointPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    for (var point in points) {
      final pointCenter = Offset(size.width * (point / 3), size.height / 2);
      canvas.drawCircle(pointCenter, pointRadius, pointPaint);
    }

    // Fill the entire slider if the value is at the last point
    if (value == 3.0) {
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(_SliderPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(1)
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
