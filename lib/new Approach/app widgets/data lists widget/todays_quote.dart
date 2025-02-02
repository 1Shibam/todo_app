import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../others/app_text_styles.dart';



class TodaysQuote extends ConsumerWidget {
  const TodaysQuote({super.key});
  
  get quoteToday => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return quoteToday.when(
        data: (quote) {
          return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(32)
                      .copyWith(topLeft: const Radius.circular(0))),
              child: ListTile(
                title: Text(
                  'Today\'s advice',
                  style:
                      AppTextStyles.normal(fontSize: 16, color: Colors.black),
                ),
                subtitle: Text(
                  quote,
                  style: AppTextStyles.bold(),
                ),
              ));
        },
        error: (error, stackTrace) {
          return Text(
            'I guess no motivation found today',
            style: AppTextStyles.normal(),
          );
        },
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ),
            ));
  }
}
