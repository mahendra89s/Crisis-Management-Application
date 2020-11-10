class Places {
  String name;
  String longitude;
  String latitude;

  Places(this.name, this.longitude, this.latitude);

  Places.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
}
