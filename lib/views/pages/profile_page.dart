import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';
import 'package:kafarat_plus_merchant/views/pages/categories/category_view_page.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/app_button.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/app_text_field_ex.common.widgets.dart';
import 'package:kafarat_plus_merchant/views/widgets/image_pick_profile_widget.dart';
import 'package:kafarat_plus_merchant/views/widgets/tamplate_widget.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TamplatePage(
        navBarIndex: 3,
        titleWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/appBarProfileImage.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  'بورفيلي',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Constants.fontColor),
                ),
              ),
            ],
          ),
        ),
        bodyBuilder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'المجلي لزيوت وشحوم السيارات',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Constants.fontColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                ImagePickProfileWidget(
                  onChange: (name, url) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.paid),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'الرصيد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    '784',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('#EB9026'),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.diamond),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'النقاط',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    '654',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: HexColor('#EB9026'),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                            radius: 5,
                            title: 'تحديد اصناف الشحن والتركيب',
                            onPressed: () {
                              AppNavigator.navigateTo(
                                  context, () => CategoryViewPage());
                            },
                            color: HexColor('#2651EB'),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        left: 30,
                        bottom: 18,
                        child: Image.asset('assets/images/box.png'))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'اسم المتجر',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'الايميل',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'العنوان',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'العنوان',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'المدينة',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'المنطقة',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'المنطقة',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'الشارع',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'المبني',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'الدور',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 10,
                    child: AppFormFieldEx(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 1,
                      maxLines: null,
                      decoration: Constants.textFieldDecoration,
                      labelText: 'الشقة',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.fontColor),
                      controller: TextEditingController(),
                      onTextChanged: (value) {
                        // widget.branchController.selectedBranch?.phoneNum =
                        //     phoneController.text;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17),
                          radius: 5,
                          title: 'تسجيل خروج',
                          onPressed: () {},
                          color: HexColor('#EB2626'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
