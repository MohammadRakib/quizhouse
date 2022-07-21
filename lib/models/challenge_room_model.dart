class ChallengeRoomModel{
  String name;
  String prize;
  String entryFee;
  String onlinePlayer;
  String color;

  ChallengeRoomModel({required this.name, required this.prize, required this.entryFee, required this.onlinePlayer,required this.color});

  @override
  String toString() {
    return 'ChallengeRoomModel{name: $name, prize: $prize, entryFee: $entryFee, onlinePlayer: $onlinePlayer}';
  }
}