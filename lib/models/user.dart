class MyUser {
  String uid;
  String name;
  String email;
  String image;
  MyUser(
      {required this.uid, required this.name, required this.email, required this.image});

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'image': image
      };
}
