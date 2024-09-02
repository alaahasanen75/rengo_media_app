import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/colors.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/bottom_view_all_widget.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/list_of_productivity.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/list_of_statuse_widget.dart';
import 'package:calender/presentation/screens/ProjectSummary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectSummary extends StatelessWidget {
  const ProjectSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backGroungColor,
      // appBar:layoutAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0).w,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(),
                  ListOfStatuseWidgets(),
                  BottomViewWidget()
                ],
              ),
            ),
            const ListOfProductivity(),
          ],
        ),
      ),
    );
  }
}
