import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/add.svg"),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'Choose Date',
                      style: TextStyles.font16blackbold,
                    )
                  ],
                )),
            SizedBox(
              height: 17.h,
            ),
            Container(
              height: 1.h,
              color: ColorsManager.containerColor,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Container(
                height: 380.h,
                color: Colors.white,
                width: double.infinity,
                child: TableCalendar(
                  daysOfWeekVisible: false,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorsManager.black),
                      canMarkersOverflow: false,
                      defaultTextStyle: TextStyles.font16Blacbold),
                  firstDay: DateTime.utc(2010, 10, 16),
                  focusedDay: DateTime.utc(2022, 3, 30),
                  lastDay: DateTime.utc(2030, 3, 30),
                ),
              ),
            ),
            Container(
              height: 1.h,
              color: ColorsManager.containerColor,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Container(
                height: 56.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: ColorsManager.black),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyles.font16whitbold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
