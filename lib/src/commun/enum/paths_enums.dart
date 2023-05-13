enum Paths {
  login(value: '/login'),
  home(value: '/home'),
  task(value: '/task'),
  taskId(value: '/task/:id');

  final String value;

  const Paths({required this.value});
}
