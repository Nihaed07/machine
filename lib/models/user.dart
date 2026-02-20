
class UserModel {
  final String name;
  final String age;
  final String phonenumber;
  String? image;

  UserModel({
    required this.name,
    required this.age,
    this.image,
    required this.phonenumber,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      age: json['age'],
      phonenumber: json['phonenumber'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'phonenumber': phonenumber,
      'image': image,
    };
  }
}