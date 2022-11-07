import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/toggle_title.common.dart';

class CategoryContainer extends StatefulWidget {
  const CategoryContainer({super.key});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/kafar.png',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexColor('#FBD25F'),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 3),
                                child: Text(
                                  'السعر : 158ر.س',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Constants.fontColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'سوني 175/70R14 NP226 82T',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Constants.fontColor),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'التفاصيل',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Constants.fontColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            isExpanded
                                ? Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: Constants.mainColor,
                                  )
                                : const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                      isExpanded
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.red,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.blue,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.green,
                                ),
                              ],
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleTitle(title: 'شحن', value: false, onToggle: (val) {}),
                const SizedBox(
                  width: 20,
                ),
                ToggleTitle(title: 'تركيب', value: true, onToggle: (val) {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
