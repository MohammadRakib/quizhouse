class ChallengeRoomModel{
  String name;
  String prize;
  String entryFee;
  String color;

  ChallengeRoomModel({required this.name, required this.prize, required this.entryFee, required this.color});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'prize': prize,
      'entryFee': entryFee,
      'color': color
    };
  }

  @override
  String toString() {
    return 'ChallengeRoomModel{name: $name, prize: $prize, entryFee: $entryFee, color: $color}';
  }
}