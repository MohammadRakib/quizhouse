class RunningTournamentModel{

  String title = '';
  String time = '';
  String prize = '';
  String color = '';

  RunningTournamentModel({required this.title, required this.time, required this.prize,required this.color});

  @override
  String toString() {
    return 'RunningTournamentModel{title: $title, time: $time, prize: $prize, color: $color}';
  }

}
