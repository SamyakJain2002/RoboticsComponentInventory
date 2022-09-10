class ComponentDetails {
  String uid;
  String imageUrl;
  String name;
  String description;
  int quantity;
  ComponentDetails(
      {this.imageUrl, this.name, this.description, this.quantity, this.uid});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory ComponentDetails.fromJson(Map<String, dynamic> json) {
    return ComponentDetails(
      uid: json['uid'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
    );
  }
}
