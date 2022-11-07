import 'package:flutter/material.dart';
import 'package:kafarat_plus_merchant/services/config.service.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';

import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class TimeoutMessage {
  static int currentMessageId = 0;
  static OverlayEntry? _activeOverlay;
  static Future<dynamic> Function()? beforeClose;

  static Future hide() async {
    if (_activeOverlay == null) {
      return;
    }

    if (beforeClose != null) {
      await beforeClose?.call();
      _activeOverlay?.remove();
      _activeOverlay = null;
      await Future.delayed(Duration(milliseconds: 500));
      return;
    }
    try {
      _activeOverlay?.remove();
    } catch (err) {
      print('XXXXXXXXXXXX cannot remove old overlay $err');
    }
    _activeOverlay = null;
  }

  static Future show(String title,
      {String? message,
      double top = 30,
      double left = 20,
      double width = 200,
      bool showSilent = false,
      int timeoutMiniseconds = 3000,
      onClick}) async {
    if (!showSilent) {
      // SoundService.play();
    }
    await hide();

    int local = ++currentMessageId; // track the messages

    _activeOverlay = OverlayEntry(
        builder: (BuildContext context) => TimeoutMessageDialog(title,
            message: message,
            top: top,
            width: width,
            left: left,
            //parentContext: context,
            onCLick: onClick));

    if (TecfyBasicApp.appGlobalkey.currentState?.overlay != null) {
      TecfyBasicApp.appGlobalkey.currentState?.overlay?.insert(_activeOverlay!);
    } else {
      print(
          'TimeoutMessage Error XXXXXXXXXXXXXXXXXXXXXXXXX context doesn\'t have overlat XXXXXXXXXXXXX');
      return;
    }

    //if (timeoutMiniseconds != null) {
    Future.delayed(Duration(milliseconds: timeoutMiniseconds)).then((_) {
      // make sure that you're removing the current message
      if (local == currentMessageId) {
        hide();
      }
    });
    //}
  }
}

class TimeoutMessageDialog extends StatefulWidget {
  final String title;
  final String? message;
  final BuildContext? parentContext;
  final double? left;
  final double? top;
  final double? width;
  final onCLick;
  TimeoutMessageDialog(this.title,
      {this.message,
      this.parentContext,
      this.top,
      this.width,
      this.left,
      this.onCLick});
  @override
  _TimeoutMessageDialogState createState() => _TimeoutMessageDialogState();
}

class _TimeoutMessageDialogState extends State<TimeoutMessageDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? _feedAnimation;
  Animation<Offset>? _offsetFloat;

  double? left;
  double? top;
  double? width;

  bool isArabic = false;

  @override
  void initState() {
    isArabic = AppConfigService.isArabic;

    TimeoutMessage.beforeClose = () async {
      await controller?.animateBack(0);
    };

    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _feedAnimation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));

    _offsetFloat =
        Tween(begin: const Offset(0.0, -0.9), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentContext != null) {
      RenderBox? renderBox =
          widget.parentContext!.findRenderObject() as RenderBox;
      var size = renderBox.size;
      var offset = renderBox.localToGlobal(Offset.zero);
      top = widget.top ?? offset.dy + size.height + 5.0;
      // left = widget.left ?? offset.dx;
      width = widget.width ?? size.width;
    }
    return Positioned(
      right: (left ?? widget.left),
      left: isArabic ? left ?? widget.left : null,
      top: top ?? widget.top,
      width: width ?? widget.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SlideTransition(
          position: _offsetFloat!,
          child: Opacity(
            opacity: _feedAnimation!.value,
            child: MaterialButton(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Constants.mainColor.withOpacity(.7),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeService.textOnMainColor)),
                      const SizedBox(
                        height: 5,
                      ),
                      widget.message == null
                          ? Container()
                          : Text(widget.message!,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: ThemeService.textOnMainColor))
                    ],
                  ),
                ),
                onPressed: () {
                  TimeoutMessage.hide();
                  if (widget.onCLick != null) {
                    widget.onCLick();
                  }
                }),
          ),
        ),
      ),
    );
  }

  divider() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(height: 1, color: Colors.white));
  }
}
