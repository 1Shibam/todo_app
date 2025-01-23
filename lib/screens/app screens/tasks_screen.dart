import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Device screen height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Defining padding and font size
    final double padding = screenWidth * 0.034;
    final double titleFontSize = screenHeight * 0.04;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todos',
          style: AppTextStyles.bold(fontSize: titleFontSize),
        ),
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            const TodaysQuote(),
            const SizedBox(height: 12),
            DefaultTabController(
              length: 3, // Number of tabs
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: AppTextStyles.normal(fontSize: 16),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blue,
                      indicatorColor: Colors.blue,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.list),
                          text: "All Tasks",
                        ),
                        Tab(
                            icon: Icon(
                              Icons.check,
                            ),
                            text: "Completed"),
                        Tab(
                            icon: Icon(
                              Icons.delete,
                            ),
                            text: "Deleted"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // First Tab (All Tasks)
                          const TaskListWidget(),

                          // Second Tab (Completed Tasks)
                          Center(
                            child: Text(
                              "Completed Tasks will appear here.",
                              style: AppTextStyles.normal(),
                            ),
                          ),
                          //third tab deleted tasks
                          Center(
                            child: Text(
                              'Deleted tasks will appear here',
                              style: AppTextStyles.normal(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
