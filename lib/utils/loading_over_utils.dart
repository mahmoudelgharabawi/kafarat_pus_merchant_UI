import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show({bool? toListen = false}) {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader(toListen));
  }

  Future<T> during<T>(Future<T> future, {bool? toListen = false}) {
    show(toListen: toListen);
    return future.whenComplete(() => hide());
  }

  Future duringEx(Future Function() future, {bool? toListen = false}) {
    show(toListen: toListen);
    return future.call().whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }

  static Future<LoadingDialogResult<T>> showFutureLoadingDialog<T>({
    required BuildContext context,
    required Future<T> Function() future,
    String? title,
    String? backLabel,
    String Function(dynamic exception)? onError,
    bool barrierDismissible = false,
    bool isCupertinoStyle = false,
  }) async {
    final dialog = LoadingDialog<T>(
      future: future,
      title: title,
      backLabel: backLabel,
      onError: onError,
      isCupertinoStyle: isCupertinoStyle,
    );
    final result = dialog.isCupertinoStyle
        ? await showCupertinoDialog<LoadingDialogResult<T>>(
            barrierDismissible: barrierDismissible,
            context: context,
            builder: (BuildContext context) => dialog,
          )
        : await showDialog<LoadingDialogResult<T>>(
            context: context,
            barrierDismissible: barrierDismissible,
            builder: (BuildContext context) => dialog,
          );
    return result ??
        LoadingDialogResult<T>(
          error: Exception('FutureDialog canceled'),
          stackTrace: StackTrace.current,
        );
  }
}

class LoadingDialog<T> extends StatefulWidget {
  final String? title;
  final String? backLabel;
  final bool isCupertinoStyle;
  final Future<T> Function() future;
  final String Function(dynamic exception)? onError;

  static String defaultTitle = 'Loading... Please Wait!';
  static String defaultBackLabel = 'Back';
  // ignore: prefer_function_declarations_over_variables
  static String Function(dynamic exception) defaultOnError =
      (exception) => exception.toString();

  const LoadingDialog(
      {Key? key,
      required this.future,
      this.title,
      this.onError,
      this.backLabel,
      this.isCupertinoStyle = false})
      : super(key: key);
  @override
  _LoadingDialogState<T> createState() => _LoadingDialogState<T>();
}

class _LoadingDialogState<T> extends State<LoadingDialog> {
  dynamic exception;
  StackTrace? stackTrace;

  @override
  void initState() {
    super.initState();
    widget.future().then(
        (result) => Navigator.of(context)
            .pop<LoadingDialogResult<T>>(LoadingDialogResult(result: result)),
        onError: (e, s) => setState(() {
              exception = e;
              stackTrace = s;
            }));
  }

  @override
  Widget build(BuildContext context) {
    final titleLabel = exception != null
        ? widget.onError?.call(exception) ??
            LoadingDialog.defaultOnError(exception)
        : widget.title ?? LoadingDialog.defaultTitle;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: exception == null
              ? const CircularProgressIndicator.adaptive()
              : const Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red,
                ),
        ),
        Text(titleLabel),
      ],
    );

    if (widget.isCupertinoStyle) {
      return CupertinoAlertDialog(
        content: content,
        actions: [
          if (exception != null)
            CupertinoDialogAction(
              onPressed: Navigator.of(context).pop,
              child: Text(widget.backLabel ?? LoadingDialog.defaultBackLabel),
            )
        ],
      );
    }
    return AlertDialog(
      content: content,
      actions: [
        if (exception != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop<LoadingDialogResult<T>>(
              LoadingDialogResult(
                error: exception,
                stackTrace: stackTrace,
              ),
            ),
            child: Text(widget.backLabel ?? LoadingDialog.defaultBackLabel),
          ),
      ],
    );
  }
}

class LoadingDialogResult<T> {
  final T? result;
  final dynamic error;
  final StackTrace? stackTrace;

  LoadingDialogResult({this.result, this.error, this.stackTrace});
}

class _FullScreenLoader extends StatelessWidget {
  final bool? _toListen;
  const _FullScreenLoader(this._toListen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: _toListen ?? false
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: ValueNotifier(0),
                    builder: (_, value, __) {
                      return Text(
                        '${value}%',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: HexColor('#404DC9'),
                          fontSize: 22,
                        ),
                      );
                    },
                  )
                ],
              ))
            : const Center(child: CircularProgressIndicator()));
  }
}
