


import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


class UserProvider extends ChangeNotifier {
  List<UserModel> user = [];
  List<UserModel> fitered_user = [];
  XFile? images;
  Uint8List? imageBytes;
  String? base64Image;

 //fetching data

  Future<void> fetchData() async {
    final localstore = await SharedPreferences.getInstance();
    final data = localstore.getString('userdata');
    if (data != null) {
      final List decodedata = jsonDecode(data);
      user = decodedata.map((e) => UserModel.fromJson(e)).toList();
      fitered_user = user;
    }
    notifyListeners();
  }

//cretae data

  Future<void> createData() async {
    final local = await SharedPreferences.getInstance();
    final data = user.map((e) => e.toJson()).toList();
    await local.setString('userdata', jsonEncode(data));
  }

//add user function
  void adduserfun({String? name, String? age, String? phonenumber}) async {
    try {
      if (name != null && name.isNotEmpty && age != null && age.isNotEmpty
      
      ) {
        user.add(
          UserModel(
            name: name,
            age: age,
            phonenumber: phonenumber ?? 'no number',
            image: base64Image,
          ),
        );
        await createData();
        base64Image = null;
        phonenumber=null;
        imageBytes = null;
        images = null;
        notifyListeners();
      } else {
        throw "Validation failed: some fields are empty or image missing";
      }
    } catch (e) {
      throw "Add user error: $e";
    }
  }

//age filter function

  Future<void> UserSearch(String data) async {
    fitered_user = user.where((element) {
      return element.name.toLowerCase().contains(data.toLowerCase()) ||
             element.age.contains(data) ||
             element.phonenumber.contains(data);
    }).toList();

    notifyListeners();
  }

//sorting
  void sortByAge(bool ascending) {
    user.sort((a, b) {
      final ageA = int.tryParse(a.age) ?? 0;
      final ageB = int.tryParse(b.age) ?? 0;

      return ascending
          ? ageB.compareTo(ageA) 
          : ageA.compareTo(ageB); 
    });

    notifyListeners();
  }

//pick image function

  void image_pic(ImageSource source) async {
    try {
      final pickimg = await ImagePicker().pickImage(source: source);
      if (pickimg != null) {
        images = pickimg;
        imageBytes = await pickimg.readAsBytes();
        base64Image = base64Encode(imageBytes!);

        notifyListeners();
        createData();
      }
    } catch (e) {
      throw 'error: $e';
    }
  }
}
