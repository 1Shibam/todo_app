import 'package:flutter/material.dart';

import '../../../themes/themes_export.dart';

class TodoDetailedView extends StatelessWidget {
  final String title;
  final String? description;
  final String? startDate;
  final String? endDate;
  final bool isComplete;

  const TodoDetailedView({
    super.key,
    required this.title,
    this.description,
    this.startDate,
    this.endDate,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyles.bold(color: Colors.black, fontSize: 24),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description?.isNotEmpty == true
                ? description!
                : 'No description provided.',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 18),
          ),
          const SizedBox(height: 15),
          if (startDate != null) ...[
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue),
                const SizedBox(width: 5),
                startDate == ''
                    ? Text(
                        'Start: not mentioned',
                        style: AppTextStyles.normal(color: Colors.black),
                      )
                    : Text(
                        'Start: $startDate',
                        style: AppTextStyles.normal(color: Colors.black),
                      )
              ],
            ),
            const SizedBox(height: 10),
          ],
          if (endDate != null) ...[
            Row(
              children: [
                const Icon(Icons.event, color: Colors.blue),
                const SizedBox(width: 5),
                endDate == ''
                    ? Text(
                        'End: not mentioned',
                        style: AppTextStyles.normal(color: Colors.black),
                      )
                    : Text(
                        'End: $endDate',
                        style: AppTextStyles.normal(color: Colors.black),
                      ),
              ],
            ),
            const SizedBox(height: 15),
          ],
          Row(
            children: [
              Icon(
                isComplete ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isComplete ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 5),
              Text(
                isComplete ? 'Completed' : 'Incomplete',
                style: AppTextStyles.bold(
                    color: isComplete ? Colors.green : Colors.red,
                    fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Close',
            style: AppTextStyles.bold(color: Colors.blue, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
