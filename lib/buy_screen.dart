import 'package:flutter/material.dart';

// 5 окно
class OldTownStoryPage extends StatelessWidget {
  const OldTownStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double scaleText(double baseSize) {
      return baseSize * (screenWidth / 375);
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/frame.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      iconSize: screenWidth * 0.04,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Your access',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: scaleText(27),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'to Old town story',
                        style: TextStyle(
                          fontSize: scaleText(27),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.13),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildFeatureItem(
                icon: Icons.castle_outlined,
                title: 'Discover Munich',
                description: 'Interactive tours to explore the city',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                scaleText: scaleText,
              ),
              _buildFeatureItem(
                icon: Icons.pin_drop_outlined,
                title: 'Start from Alter Peter',
                description: 'Begin adventure and set your own pace',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                scaleText: scaleText,
              ),
              _buildFeatureItem(
                icon: Icons.favorite_border,
                title: 'Find hidden gems',
                description: 'Solve riddles and uncover unique spots',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                scaleText: scaleText,
              ),
              _buildFeatureItem(
                icon: Icons.share_location_outlined,
                title: '2 km of discovery',
                description: 'Finish at Viktualienmarkt with a surprise',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                scaleText: scaleText,
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFC4AFFF),
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'One-time payment',
                          style: TextStyle(
                            fontSize: scaleText(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: scaleText(32),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.24),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: scaleText(14),
                                color: Colors.black,
                              ),
                              children: const [
                                TextSpan(text: 'You get indefinite access'),
                                TextSpan(text: ' to the Old town story'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/key_purple.png',
                        height: screenWidth * 0.24,
                        width: screenWidth * 0.24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      screenHeight * 0.01), // Добавлен дополнительный отступ
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Container(
                      width: screenWidth * 1,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF9F70FF),
                            Color(0xFF8437FF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth *
                            0.05, // Уменьшен горизонтальный отступ
                        vertical:
                            screenHeight * 0.02, // Увеличен вертикальный отступ
                      ),
                      child: const Text(
                        'Buy now',
                        style: TextStyle(color: Colors.white),
                        textAlign:
                            TextAlign.center, // Выравниваем текст по центру
                        maxLines:
                            1, // Устанавливаем максимальное количество строк
                        overflow: TextOverflow
                            .ellipsis, // Устанавливаем переполнение текста
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                color: Colors.transparent,
                height: screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
    required double screenWidth,
    required double screenHeight,
    required double Function(double) scaleText,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.01),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.purple,
            size: screenWidth * 0.08,
          ),
          SizedBox(width: screenWidth * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: scaleText(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.000),
              Text(
                description,
                style: TextStyle(
                  fontSize: scaleText(14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
