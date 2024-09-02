import 'dart:io';

import 'package:calender/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24).r, topRight: Radius.circular(24).r),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
                spreadRadius: 1)
          ]),
      width: double.infinity,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26).r,
                topRight: Radius.circular(26).r),
          ),
          height: 88.h,
          child: Row(
            children: [
              navItem(
                'assets/images/face.svg',
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                'assets/images/calendar.svg',
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              const SizedBox(width: 80),
              navItem(
                'assets/images/Folder.svg',
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              navItem(
                'assets/images/category.svg',
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(String? img, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          img!,
          color: selected ? ColorsManager.black : ColorsManager.lightGray,
        ),
      ),
    );
  }
}

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}
