class Note {
  String name;
  String number;

  Note(this.name, this.number);

  Note.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }
}
