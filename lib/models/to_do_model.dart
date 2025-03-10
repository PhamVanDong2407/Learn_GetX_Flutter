class ToDoModel {
  String? title;
  String? dec;
  String? id;

  ToDoModel({this.title, this.dec, this.id});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dec = json['dec'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['dec'] = this.dec;
    data['id'] = this.id;
    return data;
  }
}