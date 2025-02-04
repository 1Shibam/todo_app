import 'package:flutter/material.dart';
import 'dart:math';

import '../../../themes/themes_export.dart';

class CongratulatoryMessage extends StatelessWidget {
  const CongratulatoryMessage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> messages = [
      'Great work!',
      'Good job!',
      'Excellent!',
      'Well done!',
      'Awesome!',
      'Keep it up!',
      'Nice work!',
      'You\'re doing great!',
      'Superb!',
      'You nailed it!',
    ];
    String getRandomMessage() {
      final random = Random();
      return messages[random.nextInt(messages.length)];
    }

    return Text(
      getRandomMessage(),
      style: AppTextStyles.normal(
          color: const Color.fromARGB(255, 13, 75, 15), fontSize: 18),
    );
  }
}
