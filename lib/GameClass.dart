

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
  final List<String> explanationList;
  

  GameClass({this.explanationList, this.imagePath,this.typeOfGame, this.gameName, this.playerNumber, this.gameDuration, this.materials, this.funFactor, this.drunknessFactor, this.difficulty, this.dirtyFactor});

  factory GameClass.fromJson(Map<String, dynamic> json) {
    
    List<String> list = new List<String>();
    list.add(json['explanation1'] as String);
    list.add(json['explanation2'] as String);
    list.add(json['explanation3'] as String);
    list.add(json['explanation4'] as String);
    list.add(json['explanation5'] as String);
    list.add(json['explanation6'] as String);
    list.add(json['explanation7'] as String);
    list.add(json['explanation8'] as String);
    list.add(json['explanation9'] as String);
    list.add(json['explanation10'] as String);
    
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
      explanationList: list
    );
  }
}