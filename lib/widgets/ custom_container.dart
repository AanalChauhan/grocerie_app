import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 96, 201, 151),
                const Color.fromARGB(255, 235, 235, 133),
                const Color.fromARGB(255, 236, 172, 153),
                const Color.fromARGB(255, 200, 176, 241),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(107, 255, 255, 255),
                    const Color.fromARGB(224, 255, 255, 255),
                    const Color.fromARGB(243, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Expanded(child: Container(color: Colors.white)),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(107, 255, 255, 255),
                    const Color.fromARGB(224, 255, 255, 255),
                    const Color.fromARGB(243, 255, 255, 255),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
