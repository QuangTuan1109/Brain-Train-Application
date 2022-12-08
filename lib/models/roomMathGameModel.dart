import 'dart:convert';

class roomMathGameModel {
  String? Player;
  String? roomName;

  roomMathGameModel({
    this.Player,
    this.roomName,
  });

  roomMathGameModel copyWith({
    String? Player,
    String? roomName,
  }) {
    return roomMathGameModel(
        Player: Player ?? this.Player, roomName: roomName ?? this.roomName);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (Player != null) {
      result.addAll({'Player': Player});
    }
    if (roomName != null) {
      result.addAll({'roomName': roomName});
    }

    return result;
  }

  factory roomMathGameModel.fromMap(Map<String, dynamic> map) {
    return roomMathGameModel(
      Player: map['Player'],
      roomName: map['roomName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory roomMathGameModel.fromJson(String source) =>
      roomMathGameModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'roomMathGameModel(Player: $Player, roomName: $roomName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is roomMathGameModel &&
        other.Player == Player &&
        other.roomName == roomName;
  }

  @override
  int get hashCode => Player.hashCode ^ roomName.hashCode;
}
