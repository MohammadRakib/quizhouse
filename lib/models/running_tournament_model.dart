class RunningTournamentModel{

  String title = '';
  String time = '';
  String prize = '';
  String color = '';

  RunningTournamentModel({required this.title, required this.time, required this.prize,required this.color});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'prize': prize,
      'color': color
    };
  }

  @override
  String toString() {
    return 'RunningTournamentModel{title: $title, time: $time, prize: $prize, color: $color}';
  }

}
