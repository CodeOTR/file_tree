![Code on the Rocks](https://github.com/CodeOTR/file_tree/raw/main/assets/file_tree.png)

<p align="center">                    
<a href="https://img.shields.io/badge/License-MIT-green"><img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License"></a>
<a href="https://pub.dev/packages/code_on_the_rocks"><img src="https://img.shields.io/pub/v/file_tree?label=pub&color=orange" alt="pub version"></a>      
<a href="https://twitter.com/CodeOnTheRocks_">
    <img src="https://img.shields.io/twitter/follow/CodeOnTheRocks_?style=social">
  </a>
</p>


<p align="center">
  <a href="https://codeontherocks.dev/">Code on the Rocks</a> •
  <a href="https://github.com/CodeOTR/file_tree/">GitHub Repo</a> •
  <a href="https://pub.dev/packages/file_tree/install">Pub.dev</a>
</p>

---

Visualize the file tree of a directory 🌳

## Installation
```bash
dart pub global activate file_tree
```

## Usage
Output the file and directory tree of the current directory:
```bash
tree grow
```
Output:
```
├── LICENSE
├── test/
│  └── file_tree_test.dart
├── bin/
│  └── file_tree.dart
├── CHANGELOG.md
├── pubspec.lock
├── README.md
```
Output the file and directory tree using ASCII characters:
```bash
tree grow -a
```
Output:
```
+-- LICENSE
+-- test/
|  `-- file_tree_test.dart
+-- bin/
|  `-- file_tree.dart
+-- CHANGELOG.md
+-- pubspec.lock
+-- README.md
```

Output the file and directory tree and use emojis to indicate file type:
```bash
tree grow -e
```
Output:
```
├── 📄 LICENSE
├── 📁 test/
│  └── 📄 file_tree_test.dart
├── 📁 bin/
│  └── 📄 file_tree.dart
├── 📄 CHANGELOG.md
├── 📄 pubspec.lock
├── 📄 README.md
```

## Help
(`tree grow -h`)
```
Print out a file tree for the current directory.

Usage: tree grow [arguments]
-a, --ascii             Use only ASCII characters to draw the tree.
-e, --emojis            Add emojis to the tree to indicate file types.
-i, --include_hidden    Include hidden files in the tree
```