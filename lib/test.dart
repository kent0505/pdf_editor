import 'src/core/utils.dart';

void main() {
  List<String> test = ['aaa', 'bbb', 'ccc'];

  final sorted = test.firstWhereOrNull(
    (element) => element == 'ddd',
  );

  print(sorted);
}

// dart run lib/test.dart
