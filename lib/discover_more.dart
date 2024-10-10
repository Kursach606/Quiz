import 'package:flutter/material.dart';
import 'package:test_front/task_quiz_images.dart';

// 1 окно
class DiscoverMoreScreen extends StatelessWidget {
  const DiscoverMoreScreen({super.key});

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
                color: const Color.fromRGBO(159, 112, 255, 0.95).withOpacity(
                    1), // Слабо фиолетовый фон const Color.fromRGBO(159, 112, 255, 0.95),
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
      body: Stack(
        children: [
          Image.asset(
            'assets/town_story.png', // Убедитесь, что путь к изображению правильный
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: screenWidth * 0.8, // Установите нужную ширину
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height:
                                screenHeight * 0.02), // Добавили отступ сверху
                        Text(
                          'Discover more',
                          style: TextStyle(
                            fontSize: scaleText(24),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Find a St.Peter sign with church name and key image and scan it through the camera.',
                          style: TextStyle(fontSize: scaleText(16)),
                          textAlign: TextAlign.center,
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
                            'Next location',
                            style: TextStyle(
                                color: Colors.white), // Белый цвет текста
                          ),
                        ),
                        SizedBox(
                            height:
                                screenHeight * 0.02), // Добавили отступ снизу
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
