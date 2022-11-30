import 'package:flutter/material.dart';
import 'package:kafarat_plus_merchant/views/pages/product_details_page.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/card_widget.dart';
import 'package:kafarat_plus_merchant/views/widgets/template_widget.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class ActiveTasks extends StatefulWidget {
  const ActiveTasks({Key? key}) : super(key: key);

  @override
  State<ActiveTasks> createState() => _ActiveTasksState();
}

class _ActiveTasksState extends State<ActiveTasks>
    with TickerProviderStateMixin {
  //  late TabController _tabController;
  // final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;

  final data = {
    "الكل": [
      const CardWidget(),
      const CardWidget(),
      const CardWidget(),
    ],
    "قبول": [
      const CardWidget(),
    ],
    "المعلقة": [
      const CardWidget(),
      const CardWidget(),
    ],
    "تم التركيب": [
      const CardWidget(),
    ],
  };

  // void _scrollListener() {
  //   print('××××××××××××××××××××××××××');
  // }

  @override
  void initState() {
    // _tabController = TabController(length: 5, vsync: this);
    // _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      hasBody: false,
      // tabController: TabController(length: 4, vsync: this),
      navBarIndex: 0,
      isDrawerShown: true,
      changeAppbarBackground: true,

      titleWidget: const Text('أهلا : المجلي لزيوت وشحوم السيارات ',
          style: TextStyle(fontFamily: 'Baloo', fontWeight: FontWeight.w700)),
      headerBuilder: (_) => Expanded(
        child: ScrollableListTabScroller(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18, bottom: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.circle,
                          size: 12, color: Color.fromRGBO(217, 217, 217, 1)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data.keys.elementAt(index),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Baloo',
                        ),
                      ),
                    ],
                  ),
                ),
                ...data.values.elementAt(index).map((e) => InkWell(
                    onTap: () {
                      AppNavigator.navigateTo(
                          context, () => ProductDetailsPage());
                    },
                    child: e)),
              ],
            );
          },
          tabBuilder: (context, index, active) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  data.keys.elementAt(index),
                  style: !active
                      ? null
                      : const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy),
                ),
                Container(
                  width: 1,
                  color: const Color.fromRGBO(245, 245, 245, 1),
                ),
              ],
            );
          },
        ),
      ),
      bodyBuilder: (p0) => const SizedBox(),
    );
  }

//   SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child:   ClipRRect(
//   borderRadius: BorderRadius.circular(20),
//   child: TabBar(
//   controller: _tabController,
//   indicatorSize: TabBarIndicatorSize.label,
//   isScrollable: true,
//   indicator: MaterialIndicator(
//   color: Colors.amber,
//
//   ),
//   onTap: (int value)async {
//   currentIndex = value;
//   // _scrollController.animateTo(30, duration: Duration(seconds: 1),
//   //     curve:Curves.bounceIn );
//   setState(() {});
//   print(value);
// },
// labelColor: Colors.black,
// indicatorColor: Constants.mainColor,
// tabs: const [
// Tab(
// text: 'الكل',
// ),
// Tab(
// text: 'قبول',
// ),
// Tab(
// text: 'جاري العمل',
// ),
// Tab(
// text: 'معلقة عند العميل',
// ),
// Tab(
// text: 'تم التركيب',
// ),
// ],
// ),
// ),
// )

//
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(right: 18,bottom: 8,top: 22),
// child: Row(
// children: [
// Icon(Icons.circle,size: 12,color:  Color.fromRGBO(217,217, 217,1)),
// SizedBox(
// width: 5,
// ),
// Text(
// 'قبول',
// style: TextStyle(
// fontFamily:'Baloo',
// fontWeight: FontWeight.w500,
//
// ),
// )
// ],
// ),
// ),
// ListView.builder(itemBuilder: (context, index) => CardWidget()
// ,itemCount: 3,shrinkWrap: true,physics: BouncingScrollPhysics()),
// ],
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children:  [
// Padding(
// padding: const EdgeInsets.only(right: 18,bottom: 8,top: 22),
// child: Row(
// children: [
// Icon(Icons.circle,size: 12,color:  Color.fromRGBO(217,217, 217,1)),
// SizedBox(
// width: 5,
// ),
// Text(
// 'جاري العمل',
// style: TextStyle(
// fontFamily:'Baloo',
// fontWeight: FontWeight.w500,
//
// ),
// )
// ],
// ),
// ),
// ListView.builder(itemBuilder: (context, index) => CardWidget()
// ,itemCount: 3,shrinkWrap: true,physics: BouncingScrollPhysics()),
// ],
// ),

// Widget cardWidget(){
//   return
//     Container(
//       width: 332,
//       height: 328,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:[
//           Container(
//             width: 332,
//             height: 328,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0x19000000),
//                   blurRadius: 9,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//               color: Colors.white,
//             ),
//             child: Stack(
//               children:[
//                 Positioned(
//                   left: 58,
//                   top: 15,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Color(0xfffbd25f),
//                     ),
//                     padding: const EdgeInsets.only(top: 3, ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         Text(
//                           "السعر : 158ر.س",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 11,
//                             fontFamily: "Tajawal",
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 155,
//                   top: 15,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Color(0xfffbd25f),
//                     ),
//                     padding: const EdgeInsets.only(top: 3, ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         Text(
//                           "الكمية : 1",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 11,
//                             fontFamily: "Tajawal",
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 12,
//                   top: 15,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Color(0xff2551eb),
//                     ),
//                     padding: const EdgeInsets.only(top: 3, ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         Text(
//                           "شحن",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontFamily: "Tajawal",
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 276,
//                   top: 15,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Color(0xffd9d9d9),
//                     ),
//                     padding: const EdgeInsets.only(top: 3, ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         Text(
//                           "قبول",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Color(0xff3e3e3e),
//                             fontSize: 11,
//                             fontFamily: "Tajawal",
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 147,
//                   top: 83,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Color(0xffd9d9d9),
//                     ),
//                     padding: const EdgeInsets.only(top: 3, ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:[
//                         Text(
//                           "25/08/2022  01:58PM",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Color(0xff3e3e3e),
//                             fontSize: 11,
//                             fontFamily: "Tajawal",
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 43,
//                   child: Container(
//                     width: 332,
//                     height: 1,
//                     color: Color(0xfff5f5f5),
//                   ),
//                 ),
//                 Positioned(
//                   left: 112,
//                   top: 56,
//                   child: Text(
//                     "سوني 175/70R14 NP226 82T",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff141414),
//                       fontSize: 13,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 266,
//                   top: 56,
//                   child: Container(
//                     width: 57,
//                     height: 57,
//                     child: FlutterLogo(size: 57),
//                   ),
//                 ),
//                 Positioned(
//                   left: 201,
//                   top: 104,
//                   child: Text(
//                     "النوع :  سوني",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff646464),
//                       fontSize: 12,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 201,
//                   top: 126,
//                   child: Text(
//                     "المقاس :  17",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff646464),
//                       fontSize: 12,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 132,
//                   top: 149,
//                   child: Text(
//                     "رقم الطلب : 12654165498",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff646464),
//                       fontSize: 12,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 172,
//                   top: 194,
//                   child: Text(
//                     "معلومات العميل",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff141414),
//                       fontSize: 13,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 140,
//                   top: 216,
//                   child: Text(
//                     "الاسم :  احمد الجميل علي",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff757575),
//                       fontSize: 12,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 28,
//                   top: 284,
//                   child: Text(
//                     "الملاحظات :  هنا يتم عرض ملاحظات العميل نفسة",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xff757575),
//                       fontSize: 12,
//                       fontFamily: "Baloo Bhaijaan 2",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 22,
//                   top: 242,
//                   child: SizedBox(
//                     width: 236,
//                     height: 42,
//                     child: Text(
//                       "العنوان :   مركز مخرج (9) شارع الامام عبدالله بن سعود -حي الازدهار",
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         color: Color(0xff757575),
//                         fontSize: 12,
//                         fontFamily: "Baloo Bhaijaan 2",
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//
//   // Figma Flutter Generator Group94Widget - GROUP
//     // Container(
//     //     width: 332,
//     //     height: 328,
//     //
//     //     child: Stack(
//     //         children: <Widget>[
//     //           Positioned(
//     //               top: 0,
//     //               left: 0,
//     //               child: Container(
//     //                   width: 332,
//     //                   height: 328,
//     //                   decoration: BoxDecoration(
//     //                     borderRadius : BorderRadius.only(
//     //                       topLeft: Radius.circular(4),
//     //                       topRight: Radius.circular(4),
//     //                       bottomLeft: Radius.circular(4),
//     //                       bottomRight: Radius.circular(4),
//     //                     ),
//     //                     boxShadow : [BoxShadow(
//     //                         color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
//     //                         offset: Offset(0,2),
//     //                         blurRadius: 9
//     //                     )],
//     //                     color : Color.fromRGBO(255, 255, 255, 1),
//     //                     border : Border.all(
//     //                       color: Color.fromRGBO(246, 246, 246, 1),
//     //                       width: 1,
//     //                     ),
//     //                   )
//     //               )
//     //           ),Positioned(
//     //               top: 15,
//     //               left: 58,
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                   borderRadius : BorderRadius.only(
//     //                     topLeft: Radius.circular(3),
//     //                     topRight: Radius.circular(3),
//     //                     bottomLeft: Radius.circular(3),
//     //                     bottomRight: Radius.circular(3),
//     //                   ),
//     //                   color : Color.fromRGBO(251, 210, 95, 1),
//     //                 ),
//     //                 padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//     //                 child: Row(
//     //                   mainAxisSize: MainAxisSize.min,
//     //
//     //                   children: <Widget>[
//     //                     Text('السعر : 158ر.س', textAlign: TextAlign.right, style: TextStyle(
//     //                         color: Color.fromRGBO(0, 0, 0, 1),
//     //                         fontFamily: 'Tajawal',
//     //                         fontSize: 11,
//     //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                         fontWeight: FontWeight.normal,
//     //                         height: 1
//     //                     ),),
//     //
//     //                   ],
//     //                 ),
//     //               )
//     //           ),Positioned(
//     //               top: 15,
//     //               left: 155,
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                   borderRadius : BorderRadius.only(
//     //                     topLeft: Radius.circular(3),
//     //                     topRight: Radius.circular(3),
//     //                     bottomLeft: Radius.circular(3),
//     //                     bottomRight: Radius.circular(3),
//     //                   ),
//     //                   color : Color.fromRGBO(251, 210, 95, 1),
//     //                 ),
//     //                 padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//     //                 child: Row(
//     //                   mainAxisSize: MainAxisSize.min,
//     //
//     //                   children: <Widget>[
//     //                     Text('الكمية : 1', textAlign: TextAlign.right, style: TextStyle(
//     //                         color: Color.fromRGBO(0, 0, 0, 1),
//     //                         fontFamily: 'Tajawal',
//     //                         fontSize: 11,
//     //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                         fontWeight: FontWeight.normal,
//     //                         height: 1
//     //                     ),),
//     //
//     //                   ],
//     //                 ),
//     //               )
//     //           ),Positioned(
//     //               top: 15,
//     //               left: 12,
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                   borderRadius : BorderRadius.only(
//     //                     topLeft: Radius.circular(3),
//     //                     topRight: Radius.circular(3),
//     //                     bottomLeft: Radius.circular(3),
//     //                     bottomRight: Radius.circular(3),
//     //                   ),
//     //                   color : Color.fromRGBO(37, 81, 235, 1),
//     //                 ),
//     //                 padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//     //                 child: Row(
//     //                   mainAxisSize: MainAxisSize.min,
//     //
//     //                   children: <Widget>[
//     //                     Text('شحن', textAlign: TextAlign.right, style: TextStyle(
//     //                         color: Color.fromRGBO(255, 255, 255, 1),
//     //                         fontFamily: 'Tajawal',
//     //                         fontSize: 11,
//     //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                         fontWeight: FontWeight.normal,
//     //                         height: 1
//     //                     ),),
//     //
//     //                   ],
//     //                 ),
//     //               )
//     //           ),Positioned(
//     //               top: 15,
//     //               left: 276,
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                   borderRadius : BorderRadius.only(
//     //                     topLeft: Radius.circular(3),
//     //                     topRight: Radius.circular(3),
//     //                     bottomLeft: Radius.circular(3),
//     //                     bottomRight: Radius.circular(3),
//     //                   ),
//     //                   color : Color.fromRGBO(217, 217, 217, 1),
//     //                 ),
//     //                 padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//     //                 child: Row(
//     //                   mainAxisSize: MainAxisSize.min,
//     //
//     //                   children: <Widget>[
//     //                     Text('قبول', textAlign: TextAlign.right, style: TextStyle(
//     //                         color: Color.fromRGBO(62, 62, 62, 1),
//     //                         fontFamily: 'Tajawal',
//     //                         fontSize: 11,
//     //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                         fontWeight: FontWeight.normal,
//     //                         height: 1
//     //                     ),),
//     //
//     //                   ],
//     //                 ),
//     //               )
//     //           ),Positioned(
//     //               top: 83,
//     //               left: 147,
//     //               child: Container(
//     //                 decoration: BoxDecoration(
//     //                   borderRadius : BorderRadius.only(
//     //                     topLeft: Radius.circular(3),
//     //                     topRight: Radius.circular(3),
//     //                     bottomLeft: Radius.circular(3),
//     //                     bottomRight: Radius.circular(3),
//     //                   ),
//     //                   color : Color.fromRGBO(217, 217, 217, 1),
//     //                 ),
//     //                 padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//     //                 child: Row(
//     //                   mainAxisSize: MainAxisSize.min,
//     //
//     //                   children: <Widget>[
//     //                     Text('25/08/2022  01:58PM', textAlign: TextAlign.right, style: TextStyle(
//     //                         color: Color.fromRGBO(62, 62, 62, 1),
//     //                         fontFamily: 'Tajawal',
//     //                         fontSize: 11,
//     //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                         fontWeight: FontWeight.normal,
//     //                         height: 1
//     //                     ),),
//     //
//     //                   ],
//     //                 ),
//     //               )
//     //           ),Positioned(
//     //               top: 43,
//     //               left: 0,
//     //               child: Container(
//     //                   width: 332,
//     //                   height: 1,
//     //                   decoration: BoxDecoration(
//     //                     color : Color.fromRGBO(245, 245, 245, 1),
//     //                   )
//     //               )
//     //           ),Positioned(
//     //               top: 56,
//     //               left: 112,
//     //               child: Text('سوني 175/70R14 NP226 82T', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(20, 20, 20, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 13,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 56,
//     //               left: 266,
//     //               child: Container(
//     //                   width: 57,
//     //                   height: 57,
//     //                   decoration: BoxDecoration(
//     //                     image : DecorationImage(
//     //                         image: AssetImage('assets/images/Image823.png'),
//     //                         fit: BoxFit.fitWidth
//     //                     ),
//     //                   )
//     //               )
//     //           ),Positioned(
//     //               top: 104,
//     //               left: 201,
//     //               child: Text('النوع :  سوني', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(100, 100, 100, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 126,
//     //               left: 201,
//     //               child: Text('المقاس :  17', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(100, 100, 100, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 149,
//     //               left: 132,
//     //               child: Text('رقم الطلب : 12654165498', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(100, 100, 100, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 194,
//     //               left: 172,
//     //               child: Text('معلومات العميل', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(20, 20, 20, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 13,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 216,
//     //               left: 140,
//     //               child: Text('الاسم :  احمد الجميل علي', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(117, 117, 117, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 284,
//     //               left: 28,
//     //               child: Text('الملاحظات :  هنا يتم عرض ملاحظات العميل نفسة', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(117, 117, 117, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),Positioned(
//     //               top: 242,
//     //               left: 22,
//     //               child: Text('العنوان :   مركز مخرج (9) شارع الامام عبدالله بن سعود -حي الازدهار', textAlign: TextAlign.right, style: TextStyle(
//     //                   color: Color.fromRGBO(117, 117, 117, 1),
//     //                   fontFamily: 'Baloo Bhaijaan 2',
//     //                   fontSize: 12,
//     //                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//     //                   fontWeight: FontWeight.normal,
//     //                   height: 1
//     //               ),)
//     //           ),
//     //         ]
//     //     )
//     // );
//
// }
}
