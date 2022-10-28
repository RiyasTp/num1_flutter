class Result {
  final String status;
  final String? number;
  final int wrongPlace;
  final int correctPlace;

  Result({
    required this.status,
    this.number,
    this.wrongPlace = 0,
    this.correctPlace = 0,
  });

  @override
  String toString() {
    return 'status: $status, \n number :${number ?? {
          'unknown'
        }} \n wrongPlace: $wrongPlace , \n correctPlace: $correctPlace ';
  }
}
