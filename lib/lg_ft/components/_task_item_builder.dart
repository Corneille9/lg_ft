import 'package:flutter/material.dart';

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text("Tache $index"),
      ),
    );
  }
}
