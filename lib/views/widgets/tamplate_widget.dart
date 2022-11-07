import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';
import 'package:kafarat_plus_merchant/utils/loading_over_utils.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/scrollable_widget.common.widgets.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

class TamplatePage extends StatefulWidget {
  final String? pageTitle;
  final int? navBarIndex;
  final int? sideBarIndex;
  final Widget Function(BuildContext)? bodyBuilder;
  final Widget Function(BuildContext)? headerBuilder;
  final void Function()? onRefresh;
  final Widget? titleWidget;
  final bool isDrawerShown;
  final ScrollController? scrollController;
  final bool changeAppbarBackground;

  final Widget? fat;
  const TamplatePage(
      {required this.bodyBuilder,
      this.pageTitle,
      this.titleWidget,
      this.headerBuilder,
      this.navBarIndex,
      this.sideBarIndex,
      this.scrollController,
      this.isDrawerShown = false,
      this.changeAppbarBackground = false,
      this.fat,
      this.onRefresh,
      super.key});

  @override
  State<TamplatePage> createState() => _TamplatePageState();
}

class _TamplatePageState extends State<TamplatePage> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 700
        ? webWidget()
        : mobileWidget();
  }

  Widget webWidget() {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: HexColor('#ffffff'),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 30.0,
                    offset: const Offset(0.0, 0.0))
              ],
            ),
            child: Column(children: [
              //Header
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#F6F6F6'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: PopupMenuButton(
                            offset: const Offset(0, 45),
                            iconSize: 30,
                            icon: const Icon(
                              Icons.language,
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('English'),
                                  value: 'en',
                                ),
                                PopupMenuItem(
                                  child: Text('Arabic'),
                                  value: 'ar',
                                ),
                              ];
                            },
                            onSelected: ((value) {
                              // FoodExpressMerchantConfig.language =
                              //     value.toString();

                              // RestartWidget.restartApp(context);
                            }),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: HexColor('#C4C4C4'),
                              width: 5,
                              style: BorderStyle.solid),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Constants.mainColor,
                          minRadius: 40,
                          maxRadius: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  // FoodExpressMerchantConfig.merchant?.name
                                  //         ?.display() ??
                                  '',
                                  softWrap: false,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),

              //Body
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: WidgetScrollable(
                          columnMainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          isColumn: true,
                          widgets: [
                            // Column(
                            //   children: webDrawerItems().map((e) => e).toList()
                            //       as List<Widget>,
                            // ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('version : 0.0.1 Beta Version')],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: Stack(
              children: [
                // Container(
                //   decoration: new BoxDecoration(
                //     image: new DecorationImage(
                //       image: new AssetImage("assets/back.jpg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Image.asset(
                //   'assets/back.jpg',
                //   fit: BoxFit.cover,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //title

                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          HexColor('#FFFFFF'),
                          HexColor('#FFFFFF'),
                          HexColor('#FFFFFF'),
                          HexColor('#F6F6F6'),
                        ]),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey.shade400,
                        //       blurRadius: 30.0,
                        //       offset: const Offset(-40, 0.0))
                        // ],
                        color: HexColor('#FFFFFF'),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (Navigator.canPop(context))
                                  IconButton(
                                    onPressed: () {
                                      if (Navigator.canPop(context)) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    icon: Icon(Icons.arrow_back,
                                        size: 18, color: HexColor('#868686')),
                                  ),
                                const SizedBox(),
                                Text(
                                  widget.pageTitle ?? 'No Title',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('#868686')),
                                ),
                              ],
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  widget.onRefresh != null
                                      ? Row(
                                          children: [
                                            IconButton(
                                                tooltip: 'Refresh',
                                                onPressed: () {
                                                  LoadingOverlay.of(context)
                                                      .during(Future.delayed(
                                                          const Duration(
                                                              seconds: 1),
                                                          () => widget
                                                              .onRefresh!
                                                              .call()));
                                                },
                                                icon: Icon(
                                                  Icons.refresh,
                                                  color: HexColor('#868686'),
                                                )),
                                            const VerticalDivider(),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  IconButton(
                                      tooltip: 'Logout',
                                      onPressed: () async {
                                        ConfigService.dontClearKeys = [
                                          'language'
                                        ];

                                        var result =
                                            await LoadingOverlay.of(context)
                                                .during(Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () => ConfigService
                                                        .resetConfig()));
                                        if (result) {
                                          // AppNavigator.navigateTo(
                                          //     context, () => SplashPage(),
                                          //     replaceAll: true);
                                        } else {
                                          AppNavigator.showMessage(
                                              context,
                                              'Error in logout',
                                              MessageType.error);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.logout_outlined,
                                        color: HexColor('#868686'),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //body
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Constants.backgroundColor,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 700),
                                  child: widget.headerBuilder?.call(context) ??
                                      const SizedBox(),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: widget.scrollController ??
                                        ScrollController(),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 1000),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: widget.bodyBuilder
                                                  ?.call(context))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileWidget() {
    return Scaffold(
        backgroundColor: Constants.backgroundColor,
        drawer: widget.isDrawerShown
            ? Drawer(
                child: Drawer(),
              )
            : null,
        appBar: appBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              widget.headerBuilder?.call(context) ?? const SizedBox(),
              Expanded(
                child: widget.onRefresh == null
                    ? scrollBodyMobileWidget()
                    : RefreshIndicator(
                        onRefresh: () async {
                          widget.onRefresh!.call();
                        },
                        child: scrollBodyMobileWidget()),
              ),
            ],
          ),
        ),
        floatingActionButton: widget.fat,
        bottomNavigationBar:
            widget.navBarIndex == null ? const SizedBox() : bottomNavBar());
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Constants.mainColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          label: 'طلبات مفعلة',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          label: 'طلبات معلقة',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          label: 'الاشعارات',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          label: 'بروفايلي',
        ),
      ],
      currentIndex: widget.navBarIndex!,
      selectedItemColor: Colors.white,
      onTap: (index) {},
    );
  }

  Widget scrollBodyMobileWidget() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: widget.scrollController ?? ScrollController(),
      child: Column(
        children: [
          widget.bodyBuilder?.call(context) ?? Container(),
        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: const SizedBox.shrink(),
      elevation: 0,
      backgroundColor: widget.changeAppbarBackground
          ? Constants.mainColor
          : Constants.backgroundColor,
      title: widget.titleWidget ??
          Text(
            widget.pageTitle ?? 'No Title',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: HexColor('#000000')),
          ),
      actions: [
        Navigator.canPop(context)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_circle_left,
                      size: 30,
                      color: widget.changeAppbarBackground
                          ? Colors.white
                          : Colors.black,
                    )),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  // Widget drawerWidget() {
  //   return Column(
  //     children: [
  //       Expanded(
  //           child: ListView(controller: ScrollController(), children: <Widget>[
  //         Stack(
  //           children: [
  //             DrawerHeader(
  //               // ignore: sort_child_properties_last
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     '${AppLocale.translate(context, 'Hello')} ${FoodExpressMerchantConfig.isMerchant ? FoodExpressMerchantConfig.merchant?.name?.display() : ''}',
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 18,
  //                         color: HexColor('#000000')),
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text(
  //                               AppLocale.translate(context, 'Current Branch')),
  //                           FoodExpressMerchantConfig.isMerchant
  //                               ? const SizedBox.shrink()
  //                               : IconButton(
  //                                   onPressed: () {
  //                                     openEditBranch();
  //                                   },
  //                                   icon: const Icon(Icons.edit))
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       FoodExpressMerchantConfig.isMerchant
  //                           ? BranchesDropDown(
  //                               (value) async {
  //                                 await BranchService.getOneBranch(
  //                                     goSplash: true,
  //                                     context: context,
  //                                     branchId: value);
  //                                 setState(() {});
  //                               },
  //                               FoodExpressMerchantConfig.merchant?.branches ??
  //                                   [],
  //                               selectedValue:
  //                                   FoodExpressMerchantConfig.currentBranch?.id,
  //                             )
  //                           : Text(FoodExpressMerchantConfig
  //                                   .currentBranch?.title
  //                                   ?.display() ??
  //                               'No Title')
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               decoration: BoxDecoration(color: Constants.backgroundColor),
  //             ),
  //             Align(
  //               alignment: Alignment.topLeft,
  //               child: PopupMenuButton(
  //                 offset: const Offset(0, 45),
  //                 iconSize: 30,
  //                 icon: const Icon(
  //                   Icons.language,
  //                 ),
  //                 itemBuilder: (context) {
  //                   return [
  //                     PopupMenuItem(
  //                       child: Text('English'),
  //                       value: 'en',
  //                     ),
  //                     PopupMenuItem(
  //                       child: Text('Arabic'),
  //                       value: 'ar',
  //                     ),
  //                   ];
  //                 },
  //                 onSelected: ((value) {
  //                   FoodExpressMerchantConfig.language = value.toString();

  //                   RestartWidget.restartApp(context);
  //                 }),
  //               ),
  //             ),
  //           ],
  //         ),
  //         ...drawerItems(),
  //       ])),
  //       const SafeArea(
  //         child: Text(
  //           'Food Express Merchant v0.0.0+Beta version',
  //           style: TextStyle(color: Colors.grey),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget bottomNavBarEx() {
  //   return BottomNavyBar(
  //     selectedIndex: widget.navBarIndex ?? 0,
  //     showElevation: true,
  //     onItemSelected: (navBarIndex) {
  //       if (navBarIndex == widget.navBarIndex) {
  //         return;
  //       }

  //       FoodExpressMerchantConfig.isMerchant
  //           ? onNavBarClickedMerchant(navBarIndex)
  //           : onNavBarClickedBranch(navBarIndex);
  //     },
  //     items: (FoodExpressMerchantConfig.isMerchant)
  //         ? [
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.published_with_changes),
  //               title: Text(AppLocale.translate(context, 'Approved Orders')),
  //             ),
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.pending_actions),
  //               title: Text(AppLocale.translate(context, 'Pending Orders')),
  //             ),
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.analytics),
  //               title: Text(AppLocale.translate(context, 'Information')),
  //             ),
  //           ]
  //         : [
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.published_with_changes),
  //               title: Text(AppLocale.translate(context, 'Approved Orders')),
  //             ),
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.pending_actions),
  //               title: Text(AppLocale.translate(context, 'Pending Orders')),
  //             ),
  //             if (!FoodExpressMerchantConfig.isMerchant)
  //               BottomNavyBarItem(
  //                 icon: Icon(Icons.notifications),
  //                 title: Text(AppLocale.translate(context, 'Notifications')),
  //               ),
  //             BottomNavyBarItem(
  //               icon: Icon(Icons.analytics),
  //               title: Text(AppLocale.translate(context, 'Information')),
  //             ),
  //           ],
  //   );
  // }

  // void onNavBarClickedMerchant(int navBarIndex) {
  //   switch (navBarIndex) {
  //     case 0:
  //       AppNavigator.navigateTo(context, () => const ApprovedOrderPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);

  //       break;
  //     case 1:
  //       AppNavigator.navigateTo(context, () => const PendingOrderPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);

  //       break;

  //     case 2:
  //       AppNavigator.navigateTo(context, () => const StatisticsPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);
  //       break;
  //     default:
  //   }
  // }

  // void onNavBarClickedBranch(int navBarIndex) {
  //   switch (navBarIndex) {
  //     case 0:
  //       AppNavigator.navigateTo(context, () => const ApprovedOrderPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);

  //       break;
  //     case 1:
  //       AppNavigator.navigateTo(context, () => const PendingOrderPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);

  //       break;
  //     case 2:
  //       AppNavigator.navigateTo(context, () => NotificationPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);

  //       break;
  //     case 3:
  //       AppNavigator.navigateTo(context, () => const StatisticsPage(),
  //           animationType: AnimationTypes.none, replaceAll: true);
  //       break;
  //     default:
  //   }
  // }

  // List<Widget> drawerItems() {
  //   return [
  //     ListTile(
  //       onTap: () {
  //         AppNavigator.pop(context);
  //         AppNavigator.navigateTo(context, () => ProductsViewPage());
  //       },
  //       title: Row(
  //         children: [
  //           Icon(Icons.category, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Products"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {
  //         AppNavigator.pop(context);
  //         AppNavigator.navigateTo(context, () => OrdersHistoryPage());
  //       },
  //       title: Row(
  //         children: [
  //           Icon(Icons.list_alt, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Orders History"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {
  //         AppNavigator.pop(context);
  //         AppNavigator.navigateTo(context, () => MenusViewPage());
  //       },
  //       title: Row(
  //         children: [
  //           Icon(Icons.menu, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Menus"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     FoodExpressMerchantConfig.isMerchant
  //         ? Column(
  //             children: [
  //               ListTile(
  //                 onTap: () {
  //                   AppNavigator.pop(context);
  //                   AppNavigator.navigateTo(context, () => BranchViewPage());
  //                 },
  //                 title: Row(
  //                   children: [
  //                     Icon(Icons.home, color: HexColor('#000000')),
  //                     const SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(
  //                       AppLocale.translate(context, "Branches"),
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                           color: HexColor('#000000').withOpacity(.5)),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const Divider(),
  //             ],
  //           )
  //         : const SizedBox.shrink(),
  //     ListTile(
  //       onTap: () {
  //         AppNavigator.pop(context);
  //         AppNavigator.navigateTo(context, () => AddOnsViewPage());
  //       },
  //       title: Row(
  //         children: [
  //           Icon(Icons.post_add_rounded, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, 'AddOns'),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {},
  //       title: Row(
  //         children: [
  //           Icon(Icons.reviews, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, 'Reviews'),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {},
  //       title: Row(
  //         children: [
  //           Icon(Icons.tips_and_updates, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, 'Alerts'),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {},
  //       title: Row(
  //         children: [
  //           Icon(Icons.assignment, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Reports"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () {},
  //       title: Row(
  //         children: [
  //           Icon(Icons.password, color: HexColor('#000000')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Change Password"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#000000').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //     ListTile(
  //       onTap: () async {
  //         ConfigService.dontClearKeys = ['language'];

  //         var result = await LoadingOverlay.of(context).during(Future.delayed(
  //             const Duration(seconds: 1), () => ConfigService.resetConfig()));
  //         if (result) {
  //           AppNavigator.navigateTo(context, () => SplashPage(),
  //               replaceAll: true);
  //         } else {
  //           AppNavigator.showMessage(
  //               context, 'Error in logout', MessageType.error);
  //         }
  //       },
  //       title: Row(
  //         children: [
  //           Icon(Icons.logout, color: HexColor('#EF2525')),
  //           const SizedBox(
  //             width: 5,
  //           ),
  //           Text(
  //             AppLocale.translate(context, "Logout"),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 color: HexColor('#EF2525').withOpacity(.5)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     const Divider(),
  //   ];
  // }

  // List<Widget> webDrawerItems() {
  //   return [
  //     Container(
  //       color: widget.sideBarIndex == 0 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => const ApprovedOrderPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.published_with_changes,
  //                   color: widget.sideBarIndex == 0
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Approved Orders"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 0
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 1 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => const PendingOrderPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.pending_actions,
  //                   color: widget.sideBarIndex == 1
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Pending Orders"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 1
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     FoodExpressMerchantConfig.isMerchant
  //         ? const SizedBox.shrink()
  //         : Container(
  //             color: widget.sideBarIndex == 2 ? Constants.mainColor : null,
  //             child: Padding(
  //               padding: const EdgeInsets.all(5.0),
  //               child: ListTile(
  //                 onTap: () {
  //                   AppNavigator.navigateTo(
  //                       context, () => const NotificationPage(),
  //                       animationType: AnimationTypes.none, replaceAll: true);
  //                 },
  //                 title: Row(
  //                   children: [
  //                     Icon(Icons.notifications,
  //                         color: widget.sideBarIndex == 2
  //                             ? Colors.white
  //                             : HexColor('#000000')),
  //                     const SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(
  //                       AppLocale.translate(context, "Notifications"),
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                           color: widget.sideBarIndex == 2
  //                               ? Colors.white
  //                               : HexColor('#000000').withOpacity(.5)),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //     Container(
  //       color: widget.sideBarIndex == 3 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => const StatisticsPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.info,
  //                   color: widget.sideBarIndex == 3
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Information"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 3
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 4 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => ProductsViewPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.category,
  //                   color: widget.sideBarIndex == 4
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Products"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 4
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 5 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => OrdersHistoryPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.list_alt,
  //                   color: widget.sideBarIndex == 5
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Orders History"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 5
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 6 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => MenusViewPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.menu,
  //                   color: widget.sideBarIndex == 6
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Menus"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 6
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     FoodExpressMerchantConfig.isMerchant
  //         ? Container(
  //             color: widget.sideBarIndex == 7 ? Constants.mainColor : null,
  //             child: Padding(
  //               padding: const EdgeInsets.all(5.0),
  //               child: ListTile(
  //                 onTap: () {
  //                   AppNavigator.navigateTo(context, () => BranchViewPage(),
  //                       animationType: AnimationTypes.none, replaceAll: true);
  //                 },
  //                 title: Row(
  //                   children: [
  //                     Icon(Icons.home,
  //                         color: widget.sideBarIndex == 7
  //                             ? Colors.white
  //                             : HexColor('#000000')),
  //                     const SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(
  //                       AppLocale.translate(context, "Branches"),
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                           color: widget.sideBarIndex == 7
  //                               ? Colors.white
  //                               : HexColor('#000000').withOpacity(.5)),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           )
  //         : const SizedBox.shrink(),
  //     Container(
  //       color: widget.sideBarIndex == 8 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {
  //             AppNavigator.navigateTo(context, () => AddOnsViewPage(),
  //                 animationType: AnimationTypes.none, replaceAll: true);
  //           },
  //           title: Row(
  //             children: [
  //               Icon(Icons.post_add_rounded,
  //                   color: widget.sideBarIndex == 8
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "AddOns"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 8
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 9 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {},
  //           title: Row(
  //             children: [
  //               Icon(Icons.reviews,
  //                   color: widget.sideBarIndex == 9
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Reviews"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 9
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 10 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {},
  //           title: Row(
  //             children: [
  //               Icon(Icons.tips_and_updates,
  //                   color: widget.sideBarIndex == 10
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Alerts"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 10
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Container(
  //       color: widget.sideBarIndex == 11 ? Constants.mainColor : null,
  //       child: Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: ListTile(
  //           onTap: () {},
  //           title: Row(
  //             children: [
  //               Icon(Icons.assignment,
  //                   color: widget.sideBarIndex == 11
  //                       ? Colors.white
  //                       : HexColor('#000000')),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 AppLocale.translate(context, "Reports"),
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                     color: widget.sideBarIndex == 11
  //                         ? Colors.white
  //                         : HexColor('#000000').withOpacity(.5)),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   ];
  // }

  // void openEditBranch() async {
  //   BranchController(this)
  //       .openEdit(FoodExpressMerchantConfig.currentBranch ?? Branch());
  // }

  // void onSwicthClicked() async {
  //   var workingState = WorkingState();
  //   var result = await showDialog(
  //       context: context,
  //       builder: (_) => ChooseMenuDialog(
  //             onTapped: (menu) {
  //               workingState.menu = menu;
  //               workingState.status = (menu == null) ? false : true;
  //               workingState.branchId =
  //                   FoodExpressMerchantConfig.currentBranch?.id;
  //             },
  //           ));
  //   if (result != null) {
  //     if (!mounted) return;
  //     try {
  //       AppNavigator.showLoading(context);
  //       var result = await BranchService.updateBranchWorkingStates(
  //           workingState: workingState);
  //       if (!result.success) {
  //         if (!mounted) return;

  //         AppNavigator.resume();

  //         AppNavigator.showMessage(
  //             context, 'Error When selecting Menu', MessageType.error,
  //             message: result.message.toString());
  //         return;
  //       } else {
  //         AppNavigator.resume();
  //         await BranchService.getOneBranch(
  //             branchId: FoodExpressMerchantConfig.currentBranch?.id ?? '');
  //         setState(() {});
  //       }
  //     } catch (e) {
  //       AppNavigator.showMessage(
  //           context, 'Error When selecting Menu', MessageType.error,
  //           message: e.toString());

  //       AppNavigator.resume();
  //     }
  //   }
  // }

}
