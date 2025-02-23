import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/core/database_helper.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        onChanged: (value) {},
        items: [
          PaneItem(
            title: Text("Home"),
            body: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(showAgenda: true),
            ),
            icon: Icon(
              Icons.home,
            ),
          ),
          PaneItem(
            title: Text("Home"),
            body: Container(),
            icon: Icon(
              Icons.home,
            ),
          ),
          PaneItem(
            title: Text("Home"),
            body: Container(),
            icon: Icon(
              Icons.home,
            ),
          ),
          PaneItem(
            title: Text("Home"),
            body: Container(),
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
        displayMode: PaneDisplayMode.auto,
      ),
    );
  }
}
