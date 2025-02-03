import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/UI/widgets/other_widgets/daily_advice.dart';
import 'package:todo_app/new%20Approach/themes/app_text_styles.dart';

class TodoHomeScreen extends ConsumerStatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends ConsumerState<TodoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'T O D O S',
            style: AppTextStyles.bold(fontSize: 36),
          ),
        ),
        body: const Column(
          children: [DailyAdvice()],
        ),
      ),
    );
  }
}
