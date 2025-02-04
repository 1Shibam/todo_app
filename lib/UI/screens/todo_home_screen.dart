import 'package:flutter/material.dart';
import 'package:todo_app/themes/app_text_styles.dart';
import 'package:todo_app/UI/widgets/widgets_exports.dart';

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'T O D O S',
            style: AppTextStyles.bold(fontSize: 36),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const DailyAdvice(),
            const SizedBox(height: 12),
            Flexible(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: AppTextStyles.bold(fontSize: 16),
                      indicatorColor: Colors.blue,
                      dividerColor: Colors.blue.withOpacity(0.8),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blue,
                      tabs: const [
                        Tab(
                          text: 'All Tasks',
                          icon: Icon(Icons.task, size: 32),
                        ),
                        Tab(
                          text: 'Completed',
                          icon: Icon(Icons.check, size: 32),
                        ),
                        Tab(
                          text: 'Deleted',
                          icon: Icon(Icons.delete, size: 32),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Stack(
                            children: [
                              TodosList(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: FloatingActionWidget(),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              CompletedTodosList(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(padding: EdgeInsets.all(28.0)),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              DeletedTodosList(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: DeleteAllTodosFloatingButton(),
                                ),
                              ),
                            ],
                          ),
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
