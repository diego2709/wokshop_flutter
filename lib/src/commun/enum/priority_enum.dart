enum TypePriority {
  alta(
    value: 'alta',
    description: 'Alta',
  ),

  media(
    value: 'media',
    description: 'Media',
  ),

  baixa(
    value: 'baixa',
    description: 'Baixa',
  );

  final String value;
  final String description;

  const TypePriority({
    required this.value,
    required this.description,
  });
}
