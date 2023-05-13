// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/commun/enum/priority_enum.dart';
import 'package:my_app/src/model/task_model.dart';
import 'package:my_app/src/repository/repository_model.dart';

class TaskRepository extends ModelRepository {
  Future<List<TaskModel>> getAll() async {
    List<TaskModel> task = [];

    try {
      String uri =
          'https://b2425c80-36d7-4c43-a19f-1408fba865ae.mock.pstmn.io/tarefa';

      var response = await super.get(uri);

      final parsed = jsonDecode(response.toString());

      task = parsed['tarefas'].map<TaskModel>((e) {
        return TaskModel.fromJson(e);
      }).toList();
    } catch (e) {
      // print('Exception: ${e}');
      // throw Exception(e);
    }

    return Future(() => task);
  }

  Future<TaskModel> getById(int id) async {
    TaskModel task = const TaskModel(
      id: 0,
      titulo: '',
      descricao: '',
      prioridade: 'media',
    );

    try {
      String uri =
          'https://b2425c80-36d7-4c43-a19f-1408fba865ae.mock.pstmn.io/tarefa/$id';

      var response = await super.get(uri);

      final parsed = jsonDecode(response.toString());
      task = TaskModel.fromJson(parsed);
    } catch (e) {
      // print('Exception: ${e}');
      throw Exception(e);
    }

    return Future(() => task);
  }
}

final loginRepositoryProvider = Provider((ref) => TaskRepository());
