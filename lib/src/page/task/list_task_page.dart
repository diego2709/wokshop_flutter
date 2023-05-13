import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/src/commun/enum/routes_enums.dart';

import 'package:my_app/src/controller/list_task_controller.dart';

import 'package:my_app/src/theme/app_color.dart';

class ListTaskPage extends ConsumerStatefulWidget {
  const ListTaskPage({super.key});

  @override
  ListTastkPageState createState() => ListTastkPageState();
}

class ListTastkPageState extends ConsumerState<ListTaskPage> {
  @override
  void initState() {
    super.initState();
    ref.read(listTaskController.notifier).getAll();
  }

  removeTask(int index) {
    ref.read(listTaskController.notifier).removeTask(index);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Tarefa excluída com sucesso!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var listTask = ref.watch(listTaskController).listTask;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('${Routes.task.path.value}/0');
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: listTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(listTask[index].titulo),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listTask[index].descricao),
                                  Text(
                                      'prioridade: ${listTask[index].prioridade}'),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.push(
                                  '${Routes.task.path.value}/${listTask[index].id}');
                            },
                            icon: const Icon(
                              Icons.edit_outlined,
                              color: AppColor.primaryColorSwatch,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              removeTask(index);
                            },
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: AppColor.primaryColorSwatch,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
