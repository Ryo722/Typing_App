import 'package:flutter_test/flutter_test.dart';
import 'package:typing_app/repositories/command_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loadCommands returns list of linux commands', () async {
    final repo = CommandRepository();
    final commands = await repo.loadCommands();
    expect(commands, isNotEmpty);
    expect(commands.first.command, 'ls');
  });
}
