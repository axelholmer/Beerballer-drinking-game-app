

class GameClass {
  final String typeOfGame;
  final String gameName;
  final String playerNumber;
  final String gameDuration;
  final String materials;
  final String funFactor;
  final String drunknessFactor;
  final String difficulty;
  final String dirtyFactor;
  final String imagePath;
  
//TODO Add picture and popupmenu

  GameClass({this.imagePath,this.typeOfGame, this.gameName, this.playerNumber, this.gameDuration, this.materials, this.funFactor, this.drunknessFactor, this.difficulty, this.dirtyFactor});

  factory GameClass.fromJson(Map<String, dynamic> json) {
    return GameClass(
      typeOfGame: json['typeOfGame'] as String,
      gameName: json['gameName'] as String,
      playerNumber: json['playerNumber'] as String,
      gameDuration: json['gameDuration'] as String,
      materials: json['materials'] as String,
      funFactor: json['funFactor'] as String,
      drunknessFactor: json['drunknessFac'] as String,
      difficulty: json['difficulty'] as String,
      dirtyFactor: json['dirtyFactor'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}