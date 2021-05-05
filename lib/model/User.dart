class User {
  final String email;
  final String uImage;
  final String name;
  final String surname;
  final String type;
  final String point;
  final String uid;

  User({this.email,this.uImage, this.name, this.surname,this.type,this.point, this.uid});

  User.fromMap(Map<String,dynamic> data, String uid):
        email=data["email"],
        uImage=data["uImage"],
        name=data['name'],
        surname=data['surname'],
        type=data['type'],
        point=data['point'],
        uid=uid;

  Map<String, dynamic> toMap() {
    return {
      "email" : email,
      "uImage" : uImage,
      "name":name,
      "surname":surname,
      "type":type,
      "point":point,
    };
  }
}