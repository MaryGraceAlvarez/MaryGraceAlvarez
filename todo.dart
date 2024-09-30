import 'dart:io';

class Task {
  String title;
  bool isCompleted;

  Task(this.title, {this.isCompleted = false});

  void toggleComplete() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return '${isCompleted ? "[✓]" : "[ ]"} $title';
  }
}

void main() {
  List<Task> tasks = [];
  bool isRunning = true;

  while (isRunning) {
    print('\nTo-Do List Application');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Mark Task as Complete');
    print('4. Remove Task');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _addTask(tasks);
        break;
      case '2':
        _viewTasks(tasks);
        break;
      case '3':
        _markTaskAsComplete(tasks);
        break;
      case '4':
        _removeTask(tasks);
        break;
      case '5':
        print('Exiting...');
        isRunning = false;
        break;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void _addTask(List<Task> tasks) {
  stdout.write('Enter task title: ');
  String? title = stdin.readLineSync();
  if (title != null && title.isNotEmpty) {
    tasks.add(Task(title));
    print('Task added.');
  } else {
    print('Task title cannot be empty.');
  }
}

void _viewTasks(List<Task> tasks) {
  if (tasks.isEmpty) {
    print('No tasks available.');
  } else {
    print('\nYour Tasks:');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void _markTaskAsComplete(List<Task> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to mark as complete.');
    return;
  }
  stdout.write('Enter task number to mark as complete: ');
  String? input = stdin.readLineSync();
  int? taskNumber = int.tryParse(input ?? '');
  if (taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length) {
    tasks[taskNumber - 1].toggleComplete();
    print('Task updated.');
  } else {
    print('Invalid task number.');
  }
}

void _removeTask(List<Task> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to remove.');
    return;
  }
  stdout.write('Enter task number to remove: ');
  String? input = stdin.readLineSync();
  int? taskNumber = int.tryParse(input ?? '');
  if (taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length) {
    tasks.removeAt(taskNumber - 1);
    print('Task removed.');
  } else {
    print('Invalid task number.');
  }
}
