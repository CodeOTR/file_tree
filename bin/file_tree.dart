import 'package:args/command_runner.dart';
import 'package:file_tree/commands/grow.dart';

void main(List<String> arguments) {
  CommandRunner(
    "tree",
    "CLI for creating file trees",
  )
    ..addCommand(Grow())
    ..run(arguments);
}