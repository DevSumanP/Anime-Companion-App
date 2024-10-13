import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w800,
          ),
        ),
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 61, 187, 12),
              border: Border.fromBorderSide(BorderSide(
                  color: Color.fromARGB(255, 61, 187, 12), width: 1)),
              shape: BoxShape.circle),
          todayTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
