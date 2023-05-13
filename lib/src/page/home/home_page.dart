import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/src/commun/enum/routes_enums.dart';
import 'package:my_app/src/service/login_service.dart';
import 'package:my_app/src/theme/app_color.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(loginProvider.notifier).logoff();
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          )
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(48),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: [
          ElevatedButton(
            onPressed: () {
              context.push(Routes.task.path.value);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.lightColor,
                foregroundColor: AppColor.primaryColorSwatch,
                elevation: 5),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.task_outlined,
                    size: 48,
                    color: AppColor.primaryColorSwatch,
                  ),
                  Text(
                    'Tarefas',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
