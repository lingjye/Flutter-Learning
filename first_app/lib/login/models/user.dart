import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int id;
  @JsonKey(name: 'first_name')
  String firstname;
  @JsonKey(name: 'last_name')
  String lastname;
  String avatar;
  @JsonKey(nullable: true)
  String token;
  
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.avatar,
    this.token
  });

  User.fromJson(Map<String, dynamic>map) {
    id = int.parse(map['id']);
    firstname = map['first_name'];
    lastname = map['last_name'];
    avatar = map['avatar'];
    token = map['token'];
  }

  Map<String, dynamic> toJson () {
    return {
      'id': id,
      'first_name': firstname,
      'last_name': lastname,
      'avatar': avatar,
      'token': token
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$firstname $lastname'.toString();
  }
  

}