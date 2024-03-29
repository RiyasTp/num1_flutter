class Result {
  final String status;
  final String playedNumber;
  final String? number;
  final int wrongPlace;
  final int correctPlace;

  Result({
    required this.playedNumber,
    required this.status,
    this.number,
    this.wrongPlace = 0,
    this.correctPlace = 0,
  });

  @override
  String toString() {
    var arr =[1,2];
    arr.insert(0, 10);
    return 'you entered $playedNumber \nstatus: $status, \nnumber :${number ?? {
          'unknown'
        }} \nwrongPlace: $wrongPlace , \ncorrectPlace: $correctPlace ';
  }
}
