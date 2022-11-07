import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';

class ToggleTitle extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(bool) onToggle;
  const ToggleTitle(
      {required this.title,
      required this.value,
      required this.onToggle,
      super.key});

  @override
  State<ToggleTitle> createState() => _ToggleTitleState();
}

class _ToggleTitleState extends State<ToggleTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Constants.fontColor),
        ),
        const SizedBox(
          width: 8,
        ),
        FlutterSwitch(
          width: 35,
          height: 20,
          padding: 2,
          toggleSize: 10,
          toggleColor: (widget.value) ? Colors.white : Colors.black,
          value: widget.value,
          onToggle: widget.onToggle,
          activeColor: Constants.mainColor,
          inactiveColor: Colors.white,
          switchBorder: Border.all(
            color:
                (widget.value) ? Constants.mainColor : const Color(0xFF000000),
            width: 2.0,
          ),
          toggleBorder: Border.all(
            color: (widget.value) ? Colors.white : const Color(0xFF000000),
            width: 2.0,
          ),
        ),
      ],
    );
  }
}
