import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/logic/cubit/page_cubit.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(builder: (context, page) {
      return NavigationView(
        pane: NavigationPane(
          onChanged: (value) {
            context.read<PageCubit>().go(value);
          },
          selected: page,
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
    });
  }
}
