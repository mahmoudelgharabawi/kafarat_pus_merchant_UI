import 'package:flutter/material.dart';

import 'package:kafarat_plus_merchant/utils/size_utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     width: 320,
    //     height: 328,
    //
    //     child: Stack(
    //         children: <Widget>[
    //           Positioned(
    //               top: 0,
    //               left: 0,
    //               child: Container(
    //                   width: 332,
    //                   height: 328,
    //                   decoration: BoxDecoration(
    //                     borderRadius : const BorderRadius.only(
    //                       topLeft: Radius.circular(4),
    //                       topRight: Radius.circular(4),
    //                       bottomLeft: Radius.circular(4),
    //                       bottomRight: Radius.circular(4),
    //                     ),
    //                     boxShadow : [const BoxShadow(
    //                         color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
    //                         offset: Offset(0,2),
    //                         blurRadius: 9
    //                     )],
    //                     color : const Color.fromRGBO(255, 255, 255, 1),
    //                     border : Border.all(
    //                       color: const Color.fromRGBO(246, 246, 246, 1),
    //                       width: 1,
    //                     ),
    //                   )
    //               )
    //           ),
    //           Positioned(
    //               top: 15,
    //               left: 58,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   borderRadius : BorderRadius.only(
    //                     topLeft: Radius.circular(3),
    //                     topRight: Radius.circular(3),
    //                     bottomLeft: Radius.circular(3),
    //                     bottomRight: Radius.circular(3),
    //                   ),
    //                   color : Color.fromRGBO(251, 210, 95, 1),
    //                 ),
    //                 padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //
    //                   children: const <Widget> [
    //                      Text('السعر : 158ر.س', textAlign: TextAlign.right, style: TextStyle(
    //                         color: Color.fromRGBO(0, 0, 0, 1),
    //                         fontFamily:'BalooBhaijaan2',
    //                         fontSize: 11,
    //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                         fontWeight: FontWeight.normal,
    //                         height: 1
    //                     ),),
    //
    //                   ],
    //                 ),
    //               )
    //           ),
    //           Positioned(
    //               top: 15,
    //               left: 155,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   borderRadius : BorderRadius.only(
    //                     topLeft: Radius.circular(3),
    //                     topRight: Radius.circular(3),
    //                     bottomLeft: Radius.circular(3),
    //                     bottomRight: Radius.circular(3),
    //                   ),
    //                   color : Color.fromRGBO(251, 210, 95, 1),
    //                 ),
    //                 padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //
    //                   children:const <Widget>[
    //                      Text('الكمية : 1', textAlign: TextAlign.right, style: TextStyle(
    //                         color: Color.fromRGBO(0, 0, 0, 1),
    //                         fontFamily:'BalooBhaijaan2',
    //                         fontSize: 11,
    //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                         fontWeight: FontWeight.normal,
    //                         height: 1
    //                     ),),
    //
    //                   ],
    //                 ),
    //               )
    //           ),
    //           Positioned(
    //               top: 15,
    //               left: 12,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   borderRadius : BorderRadius.only(
    //                     topLeft: Radius.circular(3),
    //                     topRight: Radius.circular(3),
    //                     bottomLeft: Radius.circular(3),
    //                     bottomRight: Radius.circular(3),
    //                   ),
    //                   color : Color.fromRGBO(37, 81, 235, 1),
    //                 ),
    //                 padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //
    //                   children:const <Widget>[
    //                      Text('شحن', textAlign: TextAlign.right, style: TextStyle(
    //                         color: Color.fromRGBO(255, 255, 255, 1),
    //                         fontFamily:'BalooBhaijaan2',
    //                         fontSize: 11,
    //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                         fontWeight: FontWeight.normal,
    //                         height: 1
    //                     ),),
    //
    //                   ],
    //                 ),
    //               )
    //           ),
    //           Positioned(
    //               top: 15,
    //               left: 276,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   borderRadius : BorderRadius.only(
    //                     topLeft: Radius.circular(3),
    //                     topRight: Radius.circular(3),
    //                     bottomLeft: Radius.circular(3),
    //                     bottomRight: Radius.circular(3),
    //                   ),
    //                   color : Color.fromRGBO(217, 217, 217, 1),
    //                 ),
    //                 padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //
    //                   children:const <Widget>[
    //                      Text('قبول', textAlign: TextAlign.right, style: TextStyle(
    //                         color: Color.fromRGBO(62, 62, 62, 1),
    //                         fontFamily:'BalooBhaijaan2',
    //                         fontSize: 11,
    //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                         fontWeight: FontWeight.normal,
    //                         height: 1
    //                     ),),
    //
    //                   ],
    //                 ),
    //               )
    //           ),
    //           Positioned(
    //               top: 83,
    //               left: 147,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   borderRadius : BorderRadius.only(
    //                     topLeft: Radius.circular(3),
    //                     topRight: Radius.circular(3),
    //                     bottomLeft: Radius.circular(3),
    //                     bottomRight: Radius.circular(3),
    //                   ),
    //                   color : Color.fromRGBO(217, 217, 217, 1),
    //                 ),
    //                 padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //
    //                   children:const <Widget>[
    //                      Text('25/08/2022  01:58PM', textAlign: TextAlign.right, style: TextStyle(
    //                         color: Color.fromRGBO(62, 62, 62, 1),
    //                         fontFamily:'BalooBhaijaan2',
    //                         fontSize: 11,
    //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                         fontWeight: FontWeight.normal,
    //                         height: 1
    //                     ),),
    //
    //                   ],
    //                 ),
    //               )
    //           ),
    //           Positioned(
    //               top: 43,
    //               left: 0,
    //               child: Container(
    //                   width: 332,
    //                   height: 1,
    //                   decoration: const BoxDecoration(
    //                     color : Color.fromRGBO(245, 245, 245, 1),
    //                   )
    //               )
    //           ),
    //           const Positioned(
    //               top: 56,
    //               left: 112,
    //               child: Text('سوني 175/70R14 NP226 82T', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(20, 20, 20, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 13,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           Positioned(
    //               top: 56,
    //               left: 266,
    //               child: Container(
    //                   width: 57,
    //                   height: 57,
    //                   decoration: const BoxDecoration(
    //                     image : DecorationImage(
    //                         image: AssetImage('assets/images/tire.png'),
    //                         fit: BoxFit.fitWidth
    //                     ),
    //                   )
    //               )
    //           ),
    //           const Positioned(
    //               top: 104,
    //               left: 201,
    //               child: Text('النوع :  سوني', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(100, 100, 100, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 126,
    //               left: 201,
    //               child: Text('المقاس :  17', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(100, 100, 100, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 149,
    //               left: 132,
    //               child: Text('رقم الطلب : 12654165498', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(100, 100, 100, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 194,
    //               left: 172,
    //               child: Text('معلومات العميل', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(20, 20, 20, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 13,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 216,
    //               left: 140,
    //               child: Text('الاسم :  احمد الجميل علي', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(117, 117, 117, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 284,
    //               left: 28,
    //               child: Text('الملاحظات :  هنا يتم عرض ملاحظات العميل نفسة', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(117, 117, 117, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //           const Positioned(
    //               top: 242,
    //               left: 22,
    //               child: Text('العنوان :   مركز مخرج (9) شارع الامام عبدالله بن سعود -حي الازدهار', textAlign: TextAlign.right, style: TextStyle(
    //                   color: Color.fromRGBO(117, 117, 117, 1),
    //                   fontFamily:'BalooBhaijaan2',
    //                   fontSize: 12,
    //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    //                   fontWeight: FontWeight.normal,
    //                   height: 1
    //               ),)
    //           ),
    //         ]
    //     )
    // );

    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: ColorConstant.whiteA700,
    //     body: Container(
    //       width: size.width,
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: getVerticalSize(
    //                 1.00,
    //               ),
    //               width: size.width,
    //               decoration: BoxDecoration(
    //                 color: ColorConstant.gray100,
    //               ),
    //             ),
    //             Align(
    //               alignment: Alignment.centerRight,
    //               child: Padding(
    //                 padding: getPadding(
    //                   left: 28,
    //                   top: 12,
    //                   right: 9,
    //                   bottom: 26,
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Padding(
    //                       padding: getPadding(
    //                         top: 4,
    //                       ),
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         crossAxisAlignment: CrossAxisAlignment.end,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                             ),
    //                             child: Text(
    //                               "سوني 175/70R14 NP226 82T",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray900,
    //                                 fontSize: getFontSize(
    //                                   13,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w500,
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             margin: getMargin(
    //                               left: 10,
    //                               top: 5,
    //                             ),
    //                             padding: getPadding(
    //                               left: 7,
    //                               top: 2,
    //                               right: 7,
    //                               bottom: 2,
    //                             ),
    //                             decoration: BoxDecoration(
    //                               color: ColorConstant.bluegray100,
    //                               borderRadius: BorderRadius.circular(
    //                                 getHorizontalSize(
    //                                   3.00,
    //                                 ),
    //                               ),
    //                             ),
    //                             child: Text(
    //                               "25/08/2022  01:58PM",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray800,
    //                                 fontSize: getFontSize(
    //                                   11,
    //                                 ),
    //                                 fontFamily: 'Tajawal',
    //                                 fontWeight: FontWeight.w700,
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                               top: 9,
    //                             ),
    //                             child: Text(
    //                               "النوع :  سوني",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray700,
    //                                 fontSize: getFontSize(
    //                                   12,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                               top: 5,
    //                             ),
    //                             child: Text(
    //                               "المقاس :  17",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray700,
    //                                 fontSize: getFontSize(
    //                                   12,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                               top: 10,
    //                             ),
    //                             child: Text(
    //                               "رقم الطلب : 12654165498",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray700,
    //                                 fontSize: getFontSize(
    //                                   12,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                               top: 32,
    //                             ),
    //                             child: Text(
    //                               "معلومات العميل",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray900,
    //                                 fontSize: getFontSize(
    //                                   13,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 10,
    //                               top: 9,
    //                             ),
    //                             child: Text(
    //                               "الاسم :  احمد الجميل علي",
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: TextStyle(
    //                                 color: ColorConstant.gray600,
    //                                 fontSize: getFontSize(
    //                                   12,
    //                                 ),
    //                                 fontFamily: 'Baloo Bhaijaan 2',
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           Align(
    //                             alignment: Alignment.center,
    //                             child: Container(
    //                               width: getHorizontalSize(
    //                                 221.00,
    //                               ),
    //                               margin: getMargin(
    //                                 left: 8,
    //                                 top: 9,
    //                               ),
    //                               child: Text(
    //                                 "العنوان :   مركز مخرج (9) شارع الامام عبدالله بن سعود -حي الازدهار",
    //                                 maxLines: null,
    //                                 textAlign: TextAlign.right,
    //                                 style: TextStyle(
    //                                   color: ColorConstant.gray600,
    //                                   fontSize: getFontSize(
    //                                     12,
    //                                   ),
    //                                   fontFamily: 'Baloo Bhaijaan 2',
    //                                   fontWeight: FontWeight.w600,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Align(
    //                             alignment: Alignment.centerLeft,
    //                             child: Padding(
    //                               padding: getPadding(
    //                                 top: 4,
    //                               ),
    //                               child: Text(
    //                                 "الملاحظات :  هنا يتم عرض ملاحظات العميل نفسة",
    //                                 overflow: TextOverflow.ellipsis,
    //                                 textAlign: TextAlign.left,
    //                                 style: TextStyle(
    //                                   color: ColorConstant.gray600,
    //                                   fontSize: getFontSize(
    //                                     12,
    //                                   ),
    //                                   fontFamily: 'Baloo Bhaijaan 2',
    //                                   fontWeight: FontWeight.w600,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: getPadding(
    //                         left: 8,
    //                         bottom: 188,
    //                       ),
    //                       child: CommonImageView(
    //                         imagePath: ImageConstant.imgImage823,
    //                         height: getSize(
    //                           57.00,
    //                         ),
    //                         width: getSize(
    //                           57.00,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 5, right: 15, left: 10),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 15,
                    // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'قبول',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color.fromRGBO(62, 62, 62, 1),
                            fontFamily: 'Tajawal',
                            fontSize: 11,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 15,
                    // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 210, 95, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'الكمية : 1 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color.fromRGBO(62, 62, 62, 1),
                            fontFamily: 'Tajawal',
                            fontSize: 11,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 95,
                    height: 15,
                    // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 210, 95, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'السعر : 158ر.س',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color.fromRGBO(62, 62, 62, 1),
                            fontFamily: 'Tajawal',
                            fontSize: 11,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 40,
                    height: 15,
                    // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(38, 81, 235, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'شحن',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tajawal',
                            fontSize: 11,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/images/tire.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'سوني 175/70R14 NP226 82T',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                '25/08/2022  01:58PM',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromRGBO(62, 62, 62, 1),
                                    fontFamily: 'Tajawal',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                          ),
                          const Text(
                            'النوع :  سوني',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                          const Text(
                            'المقاس :  17',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                          const Text(
                            'رقم الطلب : 12654165498',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            'معلومات العميل',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'الاسم :  احمد الجميل علي',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                          const Text(
                            'العنوان :   مركز مخرج (9) شارع الامام عبدالله بن سعود -حي الازدهار',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                          const Text(
                            'الملاحظات :  هنا يتم عرض ملاحظات العميل نفسة',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Baloo',
                              fontSize: 12,
                              color: Color.fromRGBO(101, 101, 101, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
