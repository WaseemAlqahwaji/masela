import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/data/model/item.dart';
import 'package:masela/data/model/meal.dart';
import 'package:masela/logic/cubit/page_cubit.dart';
import 'package:masela/pages/host_screen/host_screen.dart';
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
              title: Text("إدارة الضيافة"),
              body: HostScreen(
                meals: [
                  Meal(
                    name: 'وجبة 1',
                    id: 1,
                    hasAppetizers: true,
                    hasItems: true,
                    items: [
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                      Item(
                        name: "item 1",
                        imagePath: "image",
                      ),
                    ],
                  ),
                ],
              ),
              icon: SizedBox.shrink(),
            ),
            PaneItem(
              title: Text("Home"),
              body: Container(),
              icon: SizedBox.shrink(),
            ),
            PaneItem(
              title: Text("إدارة الأصناف"),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [],
                ),
              ),
              icon: SizedBox.shrink(),
            ),
          ],
          displayMode: PaneDisplayMode.auto,
        ),
      );
    });
  }
}
