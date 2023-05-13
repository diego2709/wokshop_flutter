import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/commun/enum/priority_enum.dart';
import 'package:my_app/src/controller/task_controller.dart';

class TaskPage extends ConsumerStatefulWidget {
  final int id;

  const TaskPage({super.key, required this.id});

  @override
  TastkPageState createState() => TastkPageState();
}

class TastkPageState extends ConsumerState<TaskPage> {
  @override
  void initState() {
    super.initState();

    ref.read(taskController.notifier).getById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(taskController);
    var task = ref.watch(taskController).task;

    salvar() {
      if (controller.formKey.currentState!.validate()) {
        controller.formKey.currentState!.save();

        ref.read(taskController.notifier).salvar();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Tarefa alterada com sucesso!'),
        ));

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task.id == 0 ? 'Nova Tarefa' : 'Tarefa ${task.id}'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  key: Key('titulo: ${task.titulo}'),
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                  ),
                  initialValue: task.titulo,
                  onSaved: (newValue) {
                    ref.read(taskController.notifier).titulo = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o título';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  key: Key('descricao: ${task.descricao}'),
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                  ),
                  initialValue: task.descricao,
                  onSaved: (newValue) {
                    ref.read(taskController.notifier).descricao = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prioridade',
                  ),
                  items: TypePriority.values.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.description),
                    );
                  }).toList(),
                  value: task.prioridade,
                  onChanged: (newValue) {
                    ref.read(taskController.notifier).prioridade = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a prioridade';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: salvar,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
