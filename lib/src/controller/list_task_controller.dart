import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/model/task_model.dart';

import 'package:my_app/src/service/list_task_service.dart';

class ListTaskState {
  final GlobalKey<FormState> formKey;
  List<TaskModel> listTask;

  ListTaskState({
    GlobalKey<FormState>? formKey,
    List<TaskModel>? listTask,
  })  : formKey = formKey ?? GlobalKey<FormState>(),
        listTask = listTask ?? [];

  ListTaskState copyWith({
    GlobalKey<FormState>? formKey,
    List<TaskModel>? listTask,
  }) {
    return ListTaskState(
      formKey: formKey ?? this.formKey,
      listTask: listTask ?? this.listTask,
    );
  }
}

class ListTaskController extends StateNotifier<ListTaskState> {
  final Ref ref;

  ListTaskController({
    required this.ref,
  }) : super(ListTaskState());

  addTask(TaskModel newTask) {
    newTask = newTask.copyWith(id: state.listTask.last.id + 1);

    state.listTask.add(newTask);
    state = state.copyWith();
  }

  updateTask(TaskModel newTask) {
    List<TaskModel> newList = state.listTask.map<TaskModel>((e) {
      if (e.id == newTask.id) {
        return newTask;
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(listTask: newList);
  }

  getAll() async {
    var listTask = await ref.read(listTaskProvider.notifier).getAll();

    state = state.copyWith(listTask: listTask);
  }

  removeTask(index) {
    state.listTask.removeAt(index);

    state = state.copyWith();
  }
}

final listTaskController =
    StateNotifierProvider.autoDispose<ListTaskController, ListTaskState>(
  (ref) {
    return ListTaskController(
      ref: ref,
    );
  },
);
