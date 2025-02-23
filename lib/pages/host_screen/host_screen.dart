import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/data/model/meal.dart';
import 'package:masela/widgets/image_card.dart';

class HostScreen extends StatefulWidget {
  final List<Meal> meals;
  const HostScreen({
    super.key,
    required this.meals,
  });

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: Text("إدارة الضيافة"),
      ),
      content: Center(
        child: ListView.builder(
            itemCount: widget.meals.length,
            itemBuilder: (context, mealsIndex) {
              return Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 183,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => 8.width(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.meals[mealsIndex].items.length,
                        itemBuilder: (context, itemIndex) => ImageCard(
                          item: widget.meals[mealsIndex].items[itemIndex],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
