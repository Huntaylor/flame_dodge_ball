import 'dart:math';

class Id {
  Id({this.debugId}) : _value = Random().nextInt(1000000);

  final String? debugId;
  final int _value;

  @override
  String toString() {
    return debugId ?? '$_value';
  }
}
