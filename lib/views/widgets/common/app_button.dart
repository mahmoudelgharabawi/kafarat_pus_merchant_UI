import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? radius;
  final void Function()? onPressed;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle? style;
  const AppButton(
      {required this.title,
      this.radius,
      required this.onPressed,
      this.color,
      this.textAlign,
      this.style,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius ?? 15))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        textAlign: textAlign ?? TextAlign.center,
                        style: style ??
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: onPressed),
        ),
      ),
    );
  }
}
