import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/commun/enum/priority_enum.dart';
import 'package:my_app/src/controller/list_task_controller.dart';
import 'package:my_app/src/model/task_model.dart';
import 'package:my_app/src/service/task_service.dart';

class TaskState {
  final GlobalKey<FormState> formKey;
  TaskModel task;

  TaskState({
    GlobalKey<FormState>? formKey,
    TaskModel? task,
  })  : formKey = formKey ?? GlobalKey<FormState>(),
        task = task ??
            const TaskModel(
              id: 0,
              titulo: '',
              descricao: '',
              prioridade: 'media',
            );

  TaskState copyWith({
    GlobalKey<FormState>? formKey,
    TaskModel? task,
  }) {
    return TaskState(
      formKey: formKey ?? this.formKey,
      task: task ?? this.task,
    );
  }
}

class TaskController extends StateNotifier<TaskState> {
  final Ref ref;

  TaskController({
    required this.ref,
  }) : super(TaskState());

  set id(int value) {
    state = state.copyWith(task: state.task.copyWith(id: value));
  }

  set titulo(String value) {
    state = state.copyWith(task: state.task.copyWith(titulo: value));
  }

  set descricao(String value) {
    state = state.copyWith(task: state.task.copyWith(descricao: value));
  }

  set prioridade(String value) {
    state = state.copyWith(task: state.task.copyWith(prioridade: value));
  }

  getById(int id) async {
    TaskModel task;

    if (id > 0) {
      task = await ref.read(taskProvider.notifier).getById(id);
    } else {
      task = await Future.delayed(const Duration(seconds: 1), () {
        return const TaskModel(
          id: 0,
          titulo: '',
          descricao: '',
          prioridade: 'media',
        );
      });
    }

    state = state.copyWith(task: task);
  }

  salvar() {
    if (state.task.id == 0) {
      ref.read(listTaskController.notifier).addTask(state.task);
    } else {
      ref.read(listTaskController.notifier).updateTask(state.task);
    }
  }
}

final taskController =
    StateNotifierProvider.autoDispose<TaskController, TaskState>(
  (ref) {
    return TaskController(
      ref: ref,
    );
  },
);
