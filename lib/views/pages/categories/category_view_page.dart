import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';
import 'package:kafarat_plus_merchant/views/widgets/category_container.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/toggle_title.common.dart';
import 'package:kafarat_plus_merchant/views/widgets/tamplate_widget.dart';

class CategoryViewPage extends StatefulWidget {
  const CategoryViewPage({super.key});

  @override
  State<CategoryViewPage> createState() => _CategoryViewPageState();
}

class _CategoryViewPageState extends State<CategoryViewPage> {
  bool valueEx = false;
  @override
  Widget build(BuildContext context) {
    return TamplatePage(
        changeAppbarBackground: true,
        titleWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/box.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  'الاصناف',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        bodyBuilder: (_) => Column(
              children: [
                Row(
                  children: [
                    ToggleTitle(
                        title: 'الكل شحن',
                        value: valueEx,
                        onToggle: (val) {
                          setState(() {
                            valueEx = val;
                          });
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    ToggleTitle(
                        title: 'الكل تركيب',
                        value: valueEx,
                        onToggle: (val) {
                          setState(() {
                            valueEx = val;
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CategoryContainer()
              ],
            ));
  }
}
