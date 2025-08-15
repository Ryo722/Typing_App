import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/command.dart';

class CommandRepository {
  Future<List<Command>> loadCommands() async {
    final jsonString = await rootBundle.loadString('assets/linux_commands.json');
    final List<dynamic> data = json.decode(jsonString) as List<dynamic>;
    return data.map((e) => Command.fromJson(e as Map<String, dynamic>)).toList();
  }
}
