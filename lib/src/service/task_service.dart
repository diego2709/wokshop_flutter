import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/commun/enum/priority_enum.dart';
import 'package:my_app/src/controller/list_task_controller.dart';
import 'package:my_app/src/repository/task_repository.dart';
import 'package:my_app/src/model/task_model.dart';

class TaskService extends StateNotifier<TaskModel> {
  final Ref ref;
  final TaskRepository repository;

  TaskService({
    required this.ref,
    required this.repository,
    required TaskModel task,
  }) : super(task);

  Future<TaskModel> getById(int id) async {
    //so tem rota no moc para o id 1 e 2
    if ([1, 2].contains(id)) {
      state = await repository.getById(id);
    } else {
      state = await Future.delayed(const Duration(seconds: 1), () {
        return ref
            .read(listTaskController)
            .listTask
            .firstWhere((element) => element.id == id);
      });
    }

    return Future(() => state);
  }
}

final taskProvider = StateNotifierProvider<TaskService, TaskModel>(
  (ref) {
    return TaskService(
      ref: ref,
      repository: ref.watch(loginRepositoryProvider),
      task: const TaskModel(
        id: 0,
        titulo: '',
        descricao: '',
        prioridade: 'media',
      ),
    );
  },
);
