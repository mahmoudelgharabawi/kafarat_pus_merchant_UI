import 'package:flutter/material.dart';
import 'package:kafarat_plus_merchant/views/widgets/template_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      bodyBuilder: (p0) => Text('Notification Page'),
      navBarIndex: 2,
      hasBody: true,
    );
  }
}
