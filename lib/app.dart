import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/logic/cubit/items_cubit.dart';
import 'package:masela/logic/cubit/page_cubit.dart';
import 'package:masela/logic/cubit/services_cubit.dart';
import 'package:masela/pages/main_screen/main_screen.dart';

import 'core/theme/app_colors_schema.dart';
import 'core/theme/app_theme.dart';

class MaselaApp extends StatefulWidget {
  const MaselaApp({super.key});

  @override
  State<MaselaApp> createState() => _MaselaAppState();
}

class _MaselaAppState extends State<MaselaApp> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Masela',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(AppLightColor()).getThemeData(),
      home: MainScreen(),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PageCubit(),
            ),
            BlocProvider<ServicesCubit>(
              create: (context) => ServicesCubit(),
            ),
            BlocProvider<ItemsCubit>(
              create: (context) => ItemsCubit(),
            ),
          ],
          child: MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1,
            minScaleFactor: 0.8,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
            ),
          ),
        );
      },
    );
  }
}
