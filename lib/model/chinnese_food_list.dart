class ChinneseFoodList {
  String? id;
  String? title;
  String? difficulty;
  String? image;

  ChinneseFoodList({this.id, this.title, this.difficulty, this.image});

  ChinneseFoodList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    difficulty = json['difficulty'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['difficulty'] = difficulty;
    data['image'] = image;
    return data;
  }
}
