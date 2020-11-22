

class ProductClass {
  final String productName;
  final String description;
  final String url;
  final List<String> productPicturesPaths;
  

  ProductClass({this.productName, this.description, this.url, this.productPicturesPaths});

  // factory GameClass.fromJson(Map<String, dynamic> json) {
    
  //   List<String> list = new List<String>();
  //   list.add(json['explanation1'] as String);
  //   list.add(json['explanation2'] as String);
  //   list.add(json['explanation3'] as String);
  //   list.add(json['explanation4'] as String);
  //   list.add(json['explanation5'] as String);
  //   list.add(json['explanation6'] as String);
  //   list.add(json['explanation7'] as String);
  //   list.add(json['explanation8'] as String);
  //   list.add(json['explanation9'] as String);
  //   list.add(json['explanation10'] as String);
    
  //   return GameClass(
  //     typeOfGame: json['typeOfGame'] as String,
  //     gameName: json['gameName'] as String,
  //     playerNumber: json['playerNumber'] as String,
  //     gameDuration: json['gameDuration'] as String,
  //     materials: json['materials'] as String,
  //     funFactor: json['funFactor'] as String,
  //     drunknessFactor: json['drunknessFac'] as String,
  //     difficulty: json['difficulty'] as String,
  //     dirtyFactor: json['dirtyFactor'] as String,
  //     imagePath: json['imagePath'] as String,
  //     explanationList: list
  //   );
  // }
}