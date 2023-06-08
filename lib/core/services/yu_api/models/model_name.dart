enum ModelName {
  gpt3_5turbo('gpt-3.5-turbo'),
  gpt4('gpt-4');

  final String name;

  const ModelName(this.name);

  String get displayName {
    switch (this) {
      case ModelName.gpt3_5turbo:
        return 'GPT-3.5';
      case ModelName.gpt4:
        return 'GPT-4';
    }
  }
}
