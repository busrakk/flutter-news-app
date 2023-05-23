class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  // name constructed
  // kendisine gönderilen json objesinden id ve name çektik source classı oluşturuldu.
  Source.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // source classında json oluşturuldu
  Map<String, dynamic> toJSON() {
    // boş bir JSON nesnesi tanımla
    final Map<String, dynamic> dataJSON = <String, dynamic>{};
    // dataJSON = {}
    dataJSON['id'] = id; // {"id": "1213456"}
    dataJSON['name'] = name;

    return dataJSON;
  }
}
