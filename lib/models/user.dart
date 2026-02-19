// class UserModel {
//   String name;
//   String age;
//   String image;

//   UserModel({
//     required this.name,
//     required this.age,
//     required this.image,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       name: json['name'],
//       age: json['age'],
//       image: json['image'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'name': name, 'age': age,  'image': image};
//   }
// }

// Map<String, dynamic> userToJson(UserModel user) => {
//   'name': user.name,
//   'age': user.age,
//   'image': user.image,
// };


class UserModel {
  final String name;
  final String age;
  String? image;
    final String phonenumber;


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
      image: json['image'],
      phonenumber: json['phonenumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'image': image,
      'phonenumber': phonenumber,
    };
  }
}