import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kafarat_plus_merchant/helpers/file_choice_helper.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';

import 'package:uuid/uuid.dart';

class ImagePickProfileWidget extends StatelessWidget {
  final void Function(String, String?) onChange;
  // final UserData? userData;
  const ImagePickProfileWidget({required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: false
          ? Stack(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                      width: 120.0,
                      height: 120.0,
                      imageUrl: '',
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.error)))),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
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
              onTap: () {},
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Constants.mainColor,
                child: Center(
                  child: Icon(
                    Icons.image_search,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
    );
  }
}
