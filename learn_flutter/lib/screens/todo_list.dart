import 'package:flutter/material.dart';
import 'package:learn_flutter/providers/todo_provider.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../widgets/todo_widgets/all_tasks.dart';
import '../widgets/todo_widgets/completed_tasks.dart';
import '../widgets/todo_widgets/incomplete_tasks.dart';

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: TodoHomeScreen(),
    );
  }
}

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen>  with SingleTickerProviderStateMixin{
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final taskTitleController = TextEditingController();
    bool completedStatus = false;
    @override
    void dispose() {
      taskTitleController.dispose();
      super.dispose();
    }

    void onAdd() {
      late String textVal = taskTitleController.text;
      bool completed = completedStatus;
      if (textVal.isNotEmpty) {
        final Task todo = Task(
          title: textVal,
          completed: completed,
        );
        Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
        Navigator.pop(context);
        textVal = '';
      }
    }

    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Todo app'),
        ),
        body: AllTasksTab(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: Column(
                children: [
                  TextField(controller: taskTitleController),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked!;
                    }),
                    title: Text('Complete?'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed:  onAdd,
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          tooltip: 'Create',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: FloatingActionButtonLocation.endDocked,
          shape: const CircularNotchedRectangle(),
        ),
      );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'All Task',
              icon: const Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Done',
              icon: const Icon(Icons.task_alt),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

