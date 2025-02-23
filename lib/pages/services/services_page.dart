import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/data/model/service.dart';
import 'package:masela/logic/cubit/services_cubit.dart';
import 'package:masela/pages/services/add_edit_service_dialog.dart';
import 'package:masela/widgets/horizontal_card.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
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
        title: Text('إدارة الخدمات'),
        commandBar: Button(
            child: Text('إضافة'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddEditServiceDialog(),
                barrierDismissible: true,
              );
            }),
      ),
      content: BlocBuilder<ServicesCubit, List<Service>>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              separatorBuilder: (context, state) => 8.height(),
              itemCount: state.length,
              itemBuilder: (context, index) {
                return HorizontalCard(
                  title: state[index].name,
                  actions: [
                    Button(
                      child: Text('تعديل'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddEditServiceDialog(
                            service: state[index],
                          ),
                        );
                      },
                    ),
                    Button(
                      child: Text('حذف'),
                      onPressed: () {
                        context.read<ServicesCubit>().delete(state[index].id!);
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
