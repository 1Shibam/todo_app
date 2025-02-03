// import 'package:flutter/material.dart';
// import 'package:todo_app/providers/data%20providers/provider_exports.dart';
// import 'package:todo_app/providers/quote_provider/random_quote.dart';
// import 'package:todo_app/widgets/widgets_export.dart';


// class TodaysQuote extends ConsumerWidget {
//   const TodaysQuote({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final quoteToday = ref.watch(quoteProvider);
//     return quoteToday.when(
//         data: (quote) {
//           return Container(
//               margin: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                   color: Colors.lightBlue.withOpacity(0.18),
//                   borderRadius: BorderRadius.circular(32)
//                       .copyWith(topLeft: const Radius.circular(0))),
//               child: ListTile(
//                 title: Text(
//                   'Today\'s advice',
//                   style:
//                       AppTextStyles.normal(fontSize: 16, color: Colors.black),
//                 ),
//                 subtitle: Text(
//                   quote,
//                   style: AppTextStyles.bold(),
//                 ),
//               ));
//         },
//         error: (error, stackTrace) {
//           return Text(
//             'I guess no motivation found today',
//             style: AppTextStyles.normal(),
//           );
//         },
//         loading: () => const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.lightBlue,
//               ),
//             ));
//   }
// }
