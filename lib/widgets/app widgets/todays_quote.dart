import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/quote_provider/random_quote.dart';
import 'package:todo_app/widgets/app%20widgets/app_text_styles.dart';

class TodaysQuote extends ConsumerWidget {
  const TodaysQuote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteToday = ref.watch(quoteProvider);
    return quoteToday.when(
        data: (quote) {
          return Container(
            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.3)),
            child: Text(quote, style: AppTextStyles.normal()),
          );
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
