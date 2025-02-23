import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/logic/cubit/page_cubit.dart';
import 'package:masela/pages/items_page/items_page.dart' show ItemsPage;
import 'package:masela/pages/services/services_page.dart';
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
              icon: SizedBox.shrink(),
            ),
            PaneItem(
              title: Text("Home"),
              body: Container(),
              icon: SizedBox.shrink(),
            ),
            PaneItem(
              title: Text("إدارة الخدمات"),
              body: ServicesPage(),
              icon: SizedBox.shrink(),
            ),
            PaneItem(
              title: Text("إدارة الأصناف"),
              body: ItemsPage(),
              icon: SizedBox.shrink(),
            ),
          ],
          displayMode: PaneDisplayMode.auto,
        ),
      );
    });
  }
}
