import 'package:my_app/src/commun/enum/paths_enums.dart';

enum Routes {
  login(
    path: Paths.login,
    title: 'Login',
  ),

  home(
    path: Paths.home,
    title: 'Home',
  ),

  task(
    path: Paths.task,
    title: 'Tarefas',
  ),

  taskId(
    path: Paths.taskId,
    title: 'Tarefa',
  );

  final Paths path;
  final String title;

  const Routes({
    required this.path,
    required this.title,
  });
}
