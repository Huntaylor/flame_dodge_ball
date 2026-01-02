class Id {
  const Id({this.debugId});

  final String? debugId;

  @override
  String toString() {
    return debugId ?? '$hashCode';
  }
}
