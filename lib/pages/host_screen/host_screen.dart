import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/data/model/meal.dart';
import 'package:masela/pages/host_screen/add_button.dart';
import 'package:masela/widgets/horizontal_card.dart';
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
            return ConditionalBuilder(
              condition: widget.meals[mealsIndex].items.isNotEmpty,
              fallback: (context) => Column(
                children: [
                  HorizontalCard(
                    title: widget.meals[mealsIndex].name,
                    actions: [
                      Button(
                        child: Text('تعديل'),
                        onPressed: () {},
                      ),
                      Button(
                        child: Text('حذف'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  8.height(),
                ],
              ),
              builder: (context) {
                return Column(
                  children: [
                    HorizontalCard(
                      title: widget.meals[mealsIndex].name,
                      actions: [
                        Button(
                          child: Text('تعديل'),
                          onPressed: () {},
                        ),
                        Button(
                          child: Text('حذف'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    8.height(),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 183,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => 8.width(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.meals[mealsIndex].items.length,
                              itemBuilder: (context, itemIndex) {
                                if (itemIndex == 0) {
                                  return Row(
                                    children: [
                                      AddButton(
                                        onTap: () {},
                                      ),
                                      8.width(),
                                      ImageCard(
                                        item: widget
                                            .meals[mealsIndex].items[itemIndex],
                                      ),
                                    ],
                                  );
                                } else {
                                  return ImageCard(
                                    item: widget
                                        .meals[mealsIndex].items[itemIndex],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.height(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
