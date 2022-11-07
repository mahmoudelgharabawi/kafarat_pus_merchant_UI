import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

class AppFormFieldEx extends StatelessWidget {
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? regExp;
  final String? validateMessage;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final double? labelSize;

  /// must assign controller to UserData on text changed
  final void Function(String)? onTextChanged;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? description;
  final bool isRequired;
  final Widget? icon;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final bool isDarkBackgound;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final bool? enabled;
  final InputDecoration? decoration;
  final BoxDecoration? decorationIos;
  final bool? removeAllSpaces;
  final bool? fixArabicAndLeftToRight;
  final List<TextInputFormatter>? formatters;

  AppFormFieldEx(
      {this.textInputAction,
      this.controller,
      this.regExp,
      this.decoration,
      this.autovalidateMode,
      this.decorationIos,
      this.validateMessage,
      this.isDarkBackgound = false,
      this.icon,
      this.textDirection,
      this.validator,
      this.keyboardType,
      this.labelText,
      this.description,
      this.isRequired = false,
      this.onEditingComplete,
      this.onTextChanged,
      this.focusNode,
      this.enabled,
      this.obscureText = false,
      this.autoFocus = false,
      this.onFieldSubmitted,
      this.maxLines = 1,
      this.minLines,
      this.textStyle,
      this.labelSize = 16,
      this.removeAllSpaces = false,
      this.fixArabicAndLeftToRight = true,
      this.formatters}) {
    // if (onTextChanged != null && controller != null) {
    //   controller!.addListener(() {
    //     onTextChanged!(controller!.text);
    //   });
    // }
  }
  TextStyle get defaultTextStyle =>
      TextStyle(color: isDarkBackgound ? Colors.white : Colors.white);
  @override
  Widget build(BuildContext context) {
    Widget result;
    if (maxLines == null || maxLines! > 1)
      result = getMultiRowText(context);
    else
      result = icon == null
          ? getSingleRowText(context)
          : Stack(children: <Widget>[
              getSingleRowText(context),
              Container(
                  height: 60,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Align(child: icon, alignment: Alignment.centerRight))
            ]);
    return isDarkBackgound
        ? Theme(child: result, data: ThemeData.dark())
        : result;
  }

  String replaceToEnglishNumber(String input) {
    const arabic = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
      '٫',
      ',',
      '،'
    ];
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.',
      '.',
      ','
    ];

    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }

  /// Reg Expression for all arabic (numbers and letters)
  ///
  /// [\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]
  ///
  /// 012 550 335 26
  ///   ahmed hassan ahmed 012 550 335 26
  ///
  /// 22 , 333 ,44

  void _fixPastedNumber() {
    if (controller == null) return;
    if (removeAllSpaces ?? false) {
      var x = controller?.text.replaceAll(' ', '');
      if (controller!.text.contains(RegExp(r'[0-9]'))) {
        // English Number
        controller?.text = x ?? '';
      } else {
        // Arabic Number
        x = replaceToEnglishNumber(x ?? '');
        controller?.text = x;
      }
    } else {
      var x = replaceToEnglishNumber(controller?.text ?? '');
      if (controller!.text.contains(RegExp(r'[0-9]'))) {
        x = x.replaceAll(RegExp(r"(?<=[0-9./])\s+(?=[0-9./])"), '');
        controller?.text = x;
      }
    }
  }

  Widget getSingleRowText(context) {
    String? text = controller?.text;
    return !kIsWeb && Theme.of(context).platform == TargetPlatform.iOS
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                labelText == null
                    ? const SizedBox()
                    : Text(
                        '$labelText ${isRequired ? '*' : ''}',
                        style: TextStyle(
                            fontSize: labelSize,
                            color: isDarkBackgound
                                ? Colors.white
                                : Colors.black38),
                      ),
                CupertinoTextField(
                    inputFormatters: formatters,
                    controller: controller,
                    textInputAction: textInputAction,
                    keyboardType: keyboardType,
                    enableInteractiveSelection: !obscureText,

                    //validator: validator,
                    onEditingComplete: onEditingComplete,
                    obscureText: obscureText,
                    enabled: enabled,
                    maxLines: maxLines,
                    minLines: minLines,
                    placeholder: labelText,
                    focusNode: focusNode,
                    autofocus: autoFocus,
                    onSubmitted: onFieldSubmitted,
                    onChanged: (v) {
                      // debugPrint('$text -> $v');
                      if (fixArabicAndLeftToRight ?? false) {
                        if (((text?.length ?? 0) - v.length).abs() > 1) {
                          _fixPastedNumber();
                        }
                      }
                      text = controller?.text ?? v;
                      onTextChanged?.call(text!);
                    },
                    style: textStyle ?? defaultTextStyle,
                    decoration: BoxDecoration()),
                Container(
                    height: 1.0,
                    color: isDarkBackgound ? Colors.white : Colors.black),
                SizedBox(height: 15.0)
              ])
        : TextFormField(
            inputFormatters: formatters,
            autovalidateMode: autovalidateMode,
            textDirection: textDirection,
            enableInteractiveSelection: !obscureText,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            controller: controller,
            onEditingComplete: onEditingComplete,
            onChanged: (v) {
              // debugPrint('$text -> $v');
              if (fixArabicAndLeftToRight ?? false) {
                if (((text?.length ?? 0) - v.length).abs() > 1) {
                  _fixPastedNumber();
                }
              }
              text = controller?.text ?? v;
              onTextChanged?.call(text!);
            },
            focusNode: focusNode,
            validator: validator ??
                (val) {
                  if (val == null || val.isEmpty)
                    return isRequired
                        ? this.validateMessage ?? 'Required'
                        : null;
                  if (this.regExp == null) return null;
                  if (!RegExp(this.regExp!).hasMatch(val)) {
                    return this.validateMessage ?? 'Error';
                  }
                },
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            autofocus: autoFocus,
            enabled: enabled,
            style: textStyle ?? defaultTextStyle,
            onFieldSubmitted: onFieldSubmitted,
            enableSuggestions: true,
            decoration: decoration?.copyWith(
                  labelText: isRequired ? '$labelText*' : labelText,
                  helperText: description,
                  labelStyle: TextStyle(fontSize: labelSize),
                ) ??
                InputDecoration(
                  helperText: description,
                  labelText: isRequired ? '$labelText*' : labelText,
                  labelStyle: TextStyle(fontSize: labelSize),
                ),
          );
  }

  Widget getMultiRowText(context) {
    String? text = controller?.text;

    return !kIsWeb && Theme.of(context).platform == TargetPlatform.iOS
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                labelText == null
                    ? const SizedBox()
                    : Text('$labelText ${isRequired ? '*' : ''}',
                        style: TextStyle(fontSize: labelSize)),
                SizedBox(height: 5.9),
                Container(
                    height: maxLines == null ? null : 25.0 * maxLines!,
                    decoration: decorationIos ??
                        ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                side: BorderSide(color: Colors.black38))),
                    child: Scrollbar(
                        child: SingleChildScrollView(
                            child: CupertinoTextField(
                                inputFormatters: formatters,
                                controller: controller,
                                onEditingComplete: onEditingComplete,
                                enableInteractiveSelection: true,
                                focusNode: focusNode,
                                textInputAction: textInputAction,
                                keyboardType: TextInputType.multiline,
                                obscureText: obscureText,
                                maxLines: maxLines,
                                minLines: minLines,
                                enabled: enabled,
                                placeholder: labelText,
                                onChanged: (v) {
                                  // debugPrint('$text -> $v');
                                  if (fixArabicAndLeftToRight ?? false) {
                                    if (((text?.length ?? 0) - v.length).abs() >
                                        1) {
                                      _fixPastedNumber();
                                    }
                                  }
                                  text = controller?.text ?? v;
                                  onTextChanged?.call(text!);
                                },
                                style: textStyle ?? defaultTextStyle,
                                decoration: BoxDecoration()))))
              ])
        : TextFormField(
            inputFormatters: formatters,
            autovalidateMode: autovalidateMode,
            textDirection: textDirection,
            enableInteractiveSelection: true,
            textInputAction: textInputAction,
            keyboardType: TextInputType.multiline,
            controller: controller,
            onEditingComplete: onEditingComplete,
            onChanged: (v) {
              // debugPrint('$text -> $v');

              if (fixArabicAndLeftToRight ?? false) {
                if (((text?.length ?? 0) - v.length).abs() > 1) {
                  _fixPastedNumber();
                }
              }
              text = controller?.text ?? v;
              onTextChanged?.call(text!);
            },
            validator: validator ??
                (val) {
                  if (val == null || val.isEmpty)
                    return isRequired
                        ? this.validateMessage ?? 'Required'
                        : null;
                  if (this.regExp == null) return null;
                  if (!RegExp(this.regExp!).hasMatch(val)) {
                    return this.validateMessage ?? 'Error';
                  }
                },
            obscureText: obscureText,
            enabled: enabled,
            focusNode: focusNode,
            maxLines: maxLines,
            minLines: minLines,
            style: textStyle ?? defaultTextStyle,
            decoration: decoration?.copyWith(
                    labelText: isRequired ? '$labelText*' : labelText,
                    helperText: description,
                    labelStyle: TextStyle(fontSize: labelSize)) ??
                InputDecoration(
                    helperText: description,
                    labelText: isRequired ? '$labelText*' : labelText,
                    labelStyle: TextStyle(fontSize: labelSize)),
          );
  }
}
