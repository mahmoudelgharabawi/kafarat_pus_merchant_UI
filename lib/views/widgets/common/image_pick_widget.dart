import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kafarat_plus_merchant/helpers/file_choice_helper.dart';

class ImagePickWidget extends StatelessWidget {
  final String cartTitle;
  final String nameField;
  final String pathField;
  final String userType;
  final void Function(String) onChange;
  final String? imageValue;
  const ImagePickWidget(this.cartTitle,
      {required this.nameField,
      required this.pathField,
      required this.userType,
      required this.onChange,
      this.imageValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      cartTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: imageValue != null
                    ? Stack(
                        children: [
                          Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                              child: Image.network(
                                imageValue!,
                                fit: BoxFit.fill,
                              )),
                          InkWell(
                            onTap: () {
                              FileChoiceHelper.showChoiceDialog(
                                  context, onChange,
                                  nameField: nameField,
                                  pathField: pathField,
                                  userType: userType);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          FileChoiceHelper.showChoiceDialog(context, onChange,
                              nameField: nameField,
                              pathField: pathField,
                              userType: userType);
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Icon(
                              Icons.image_search,
                              size: 60,
                            ),
                          ),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
