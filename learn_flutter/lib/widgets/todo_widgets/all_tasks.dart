import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/providers/todo_provider.dart';
import 'package:learn_flutter/widgets/todo_widgets/tast_list.dart';
import 'package:provider/provider.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todos, child) => TaskList(
        tasks: todos.allTasks,
      ),
    );
  }
}

