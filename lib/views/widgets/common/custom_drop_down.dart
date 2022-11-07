import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

class CustomDropDown<T> extends StatefulWidget {
  final void Function(String?) callback;
  final String? selectedValue;
  final String hintText;
  final List<T> list;
  final Color? color;
  const CustomDropDown(this.callback, this.list, this.hintText,
      {this.selectedValue, this.color = Colors.white, super.key});
  @override
  State<CustomDropDown> createState() {
    return _CustomDropDownState();
  }
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedVal;
  String _notSelected = '';

  // void valueSelected(String? item) {
  //   _selectedVal = item;
  //   widget.callback(item);
  //   setState(() {});
  // }

  @override
  void initState() {
    //implement initState
    _selectedVal = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: MediaQuery.of(context).size.width,
        // height: 65.0,
        decoration: ShapeDecoration(
            color: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        child: Padding(
            padding: EdgeInsets.only(
              right: 15.0,
              left: 15.0,
              top: 5,
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              hint: Text(widget.hintText),
              isExpanded: true,
              items: widget.list.map((document) {
                var item = DropdownMenuItem<String>(
                    value: document,
                    child: Container(child: Text(document ?? '')));
                if (item.value == _selectedVal) _selectedVal = item.value;
                return item;
              }).toList(),
              onChanged: (x) {
                _selectedVal = x;
                widget.callback(x);
                setState(() {});
              },
              value: _selectedVal,
            ))));
  }
}
