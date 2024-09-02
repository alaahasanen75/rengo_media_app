import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/colors.dart';
import 'package:calender/presentation/calender/screens/calenderView.dart';
import 'package:calender/presentation/product/product_screen.dart';
import 'package:calender/presentation/screens/LayOut/widgets/nav_bar.dart';
import 'package:calender/presentation/screens/ProjectSummary/screens/project_summary_screen.dart';
import 'package:flutter/material.dart';

class LayOytScreen extends StatefulWidget {
  const LayOytScreen({super.key});

  @override
  State<LayOytScreen> createState() => _LayOytScreenState();
}

class _LayOytScreenState extends State<LayOytScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];
  List<String> Title = [];

  @override
  void initState() {
    super.initState();
    Title = ['Product', 'Calendar', 'Project Summary', 'Product'];

    items = [
      NavModel(
        page: const ProductScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: CalendarScreen(
          contextt: context,
        ),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const ProjectSummary(),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const ProductScreen(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: layoutAppBar(Title[selectedTab]),
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: ColorsManager.black,
            elevation: 0,
            onPressed: () => debugPrint("Add Button pressed"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
