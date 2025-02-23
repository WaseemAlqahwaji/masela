import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
