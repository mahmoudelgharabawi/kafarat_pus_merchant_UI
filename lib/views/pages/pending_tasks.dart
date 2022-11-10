import 'package:flutter/material.dart';
import 'package:kafarat_plus_merchant/views/widgets/template_widget.dart';

class PendingTasks extends StatefulWidget {
  const PendingTasks({Key? key}) : super(key: key);

  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      bodyBuilder: (_) => const Text('Pending Tasks'),
      navBarIndex: 1,
      hasBody: true,
    );
  }
}
