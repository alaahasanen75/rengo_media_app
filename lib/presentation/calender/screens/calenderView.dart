import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// Make sure to adjust the imports according to your project's structure
// import 'package:calendar/core/theming/colors.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({super.key,required this.contextt});
  BuildContext contextt;
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  bool _isScheduleSelected = true; // State to toggle between Schedule and Task

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ColorsManager.backGroungColor, // Adjust according to your theme
      body: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(.3),
          ),
          SizedBox(
            height: 24.h,
          ),
          _buildHeader(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: SizedBox(
              height: 80.h,
              child: _buildDateSlider(),
            ),
          ),
          _buildToggleButtons(),
          // SizedBox(
          //   height: 10.h,
          // ),
          Expanded(
            child: _isScheduleSelected
                ? _buildScheduleSection()
                : _buildTaskSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            '${_getMonthAbbreviation(_selectedDate.month)} ${_selectedDate.year}',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
              onTap: () => ShowBottomSheet(widget.contextt),
              child: SvgPicture.asset('assets/images/arrow-down.svg')),
          Spacer(),
          _buildMonthNavigationButton(Icons.chevron_left, () {
            setState(() {
              _selectedDate = DateTime(
                _selectedDate.year,
                _selectedDate.month - 1,
                1,
              );
            });
          }),
          SizedBox(
            width: 8.w,
          ),
          _buildMonthNavigationButton(Icons.chevron_right, () {
            setState(() {
              _selectedDate = DateTime(
                _selectedDate.year,
                _selectedDate.month + 1,
                1,
              );
            });
          }),
        ],
      ),
    );
  }

  Widget _buildMonthNavigationButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(
          color: Colors.grey, // Adjust the border color according to your theme
          width: 1.5.w,
        ),
      ),
      child: GestureDetector(
        child: Icon(icon),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDateSlider() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (context, index) {
        DateTime date = DateTime.now().add(Duration(days: index));
        bool isSelected = date.day == _selectedDate.day &&
            date.month == _selectedDate.month &&
            date.year == _selectedDate.year;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            width: 60.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.1),
              //     blurRadius: 4,
              //     offset: const Offset(0, 2),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getDayOfWeek(date.weekday),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildToggleButton('Schedule', _isScheduleSelected, () {
          setState(() {
            _isScheduleSelected = true;
          });
        }),
        SizedBox(width: 20.w),
        _buildToggleButton('Task', !_isScheduleSelected, () {
          setState(() {
            _isScheduleSelected = false;
          });
        }),
      ],
    );
  }

  Widget _buildToggleButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40.h,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Spacer(),
            Container(
              width: 160.w,
              height: 1.5,
              color: isSelected ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SfCalendar(
              showCurrentTimeIndicator: true,
              showDatePickerButton: false,
              view: CalendarView.day,
              dataSource: MeetingDataSource(_getDataSource()),
              todayHighlightColor: Colors.black,
              initialDisplayDate: _selectedDate,
              headerHeight: 0,
              // timeRegionBuilder:  ,
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 0,
                endHour: 24,
                timeIntervalHeight: 70,
                timeIntervalWidth: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> title = [
    'Meeting Concept',
    'Information Architecture',
    'Monitoring Project',
    'Daily Standup'
  ];
  List<String> descrptions = [
    'Due Date : Mon, 12 Jan 2023',
    'Due Date : Mon, 12 Jan 2023',
    'Due Date : Mon, 12 Jan 2023',
    'Due Date : Mon, 12 Jan 2023'
  ];
  Widget _buildTaskSection() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: title.length, // Example task count
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.08),
                  blurRadius: 24,
                  offset: const Offset(4, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title[index],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      descrptions[index],
                      style: TextStyle(
                        color: ColorsManager.textColormin,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/images/tick-square.svg',
                  width: 24.h,
                  height: 24.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = _selectedDate;
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 1));
    meetings.add(Meeting('Sprint Review Period 02 in May 2022', startTime,
        endTime, Colors.purple, false));
    meetings.add(Meeting(
        'Meeting with Client',
        DateTime(today.year, today.month, today.day, 11, 0, 0),
        DateTime(today.year, today.month, today.day, 12, 0, 0),
        Colors.orange,
        false));
    meetings.add(Meeting(
        'Daily Standup',
        DateTime(today.year, today.month, today.day, 12, 0, 0),
        DateTime(today.year, today.month, today.day, 12, 30, 0),
        Colors.green,
        false));
    return meetings;
  }

  String _getDayOfWeek(int weekday) {
    const List<String> weekdays = [
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT'
    ];
    return weekdays[weekday % 7];
  }

  String _getMonthAbbreviation(int month) {
    const List<String> monthAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthAbbreviations[month - 1];
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
