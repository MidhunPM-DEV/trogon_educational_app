class BaseException {
  final String messege;
  BaseException(this.messege);

  @override
  String toString() {
    return messege;
  }
}
