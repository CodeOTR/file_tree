import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

class Grow extends Command {
  @override
  String get description => 'Print out a file tree for the current directory.';

  @override
  String get name => 'grow';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addFlag(
        'ascii',
        abbr: 'a',
        defaultsTo: false,
        negatable: false,
        help: 'Use only ASCII characters to draw the tree.',
      )
      ..addFlag('emojis',
          abbr: 'e',
          defaultsTo: false,
          negatable: false,
          help: 'Add emojis to the tree to indicate file types.')
      ..addFlag('include_hidden',
          abbr: 'i',
          defaultsTo: false,
          negatable: false,
          help: 'Include hidden files in the tree');
  }

  @override
  Future<void> run() async {
    final currentDirectory = Directory.current;
    await _printFileTree(currentDirectory);
  }

  Future<void> _printFileTree(Directory directory, {String prefix = ''}) async {
    final ascii = argResults!['ascii'] as bool;

    final includeHidden = argResults!['include_hidden'] as bool;

    final files = directory.listSync();

    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final isLast = i == files.length - 1;

      if (!includeHidden && file.path.split(Platform.pathSeparator).last.startsWith('.')) {
        continue;
      }

      String lastBranchCharacter = ascii ? '`-- ' : '└── ';
      String branchCharacter = ascii ? '+-- ' : '├── ';
      String prefixCharacter = ascii ? '|  ' : '│  ';

      if (argResults!['emojis'] as bool) {
        if (file is Directory) {
          lastBranchCharacter += '📁 ';
          branchCharacter += '📁 ';
        } else {
          lastBranchCharacter += '📄 ';
          branchCharacter += '📄 ';
        }
      }

      stdout.write(
          '$prefix${isLast ? lastBranchCharacter : branchCharacter}${file.path.split(Platform.pathSeparator).last}');
      if (file is Directory) {
        stdout.writeln('/');
        await _printFileTree(file,
            prefix: '$prefix${isLast ? '    ' : prefixCharacter}');
      } else {
        stdout.writeln();
      }
    }
  }
}
