class Command {
  final String command;
  final String description;

  Command({required this.command, required this.description});

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      command: json['command'] as String,
      description: json['description'] as String,
    );
  }
}
