import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 239, 161, 137),
                const Color.fromARGB(255, 92, 205, 150),
                const Color.fromARGB(255, 240, 240, 131),
                const Color.fromARGB(255, 239, 161, 137),
                const Color.fromARGB(255, 192, 166, 236),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(198, 255, 255, 255),
                    const Color.fromARGB(201, 255, 255, 255),
                    const Color.fromARGB(240, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Expanded(
              child: Container(color: const Color.fromARGB(236, 255, 255, 255)),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(198, 255, 255, 255),
                    const Color.fromARGB(201, 255, 255, 255),
                    const Color.fromARGB(240, 255, 255, 255),
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
