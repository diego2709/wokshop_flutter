import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/repository/task_repository.dart';
import 'package:my_app/src/model/task_model.dart';

class ListTaskService extends StateNotifier<List<TaskModel>> {
  final Ref ref;
  final TaskRepository repository;

  ListTaskService({
    required this.ref,
    required this.repository,
    required List<TaskModel> listTask,
  }) : super(listTask);

  Future<List<TaskModel>> getAll() async {
    state = await repository.getAll();

    return Future(() => state);
  }
}

final listTaskProvider =
    StateNotifierProvider<ListTaskService, List<TaskModel>>(
  (ref) {
    return ListTaskService(
      ref: ref,
      repository: ref.watch(loginRepositoryProvider),
      listTask: [],
    );
  },
);
