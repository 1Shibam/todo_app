import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app widgets/others/app_text_styles.dart';
import '../../../providers/state provider/random_quote_provider.dart';

class TodaysAdvice extends ConsumerWidget {
  const TodaysAdvice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteToday = ref.watch(randomQuoteProvider);
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
