import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/data/model/item.dart';
import 'package:masela/logic/cubit/items_cubit.dart';
import 'package:masela/logic/cubit/services_cubit.dart';
import 'package:masela/pages/items_page/add_edit_item_dialog.dart';
import 'package:masela/widgets/image_card.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) {
      context.read<ServicesCubit>().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: Text('إدارة الأصناف'),
        commandBar: Button(
            child: Text('إضافة'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddEditItemDialog(),
                barrierDismissible: true,
              );
            }),
      ),
      content: BlocBuilder<ItemsCubit, List<Item>>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 260,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 260,
              ),
              itemCount: state.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => AddEditItemDialog(
                          item: state[i],
                        ),
                      );
                    },
                    child: ImageCard(item: state[i]));
              }),
        );
      }),
    );
  }
}
