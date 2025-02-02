import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class FloatingActionButtonWidget extends ConsumerWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog();
          },
        );
      },
      backgroundColor: Colors.white70,
      child: const Icon(Icons.add_task),
    );
  }
}
