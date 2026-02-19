import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machine/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {
  List<UserModel> user = [];
  List<UserModel> filtereduser = [];
  XFile? images;
  Uint8List? imageBytes;
  String? base64Image;

  // fetchding data

  Future<void> fetchData() async {
    final localstore = await SharedPreferences.getInstance();
    final data = localstore.getString('userdata');
    if (data != null) {
      final List decodedata = jsonDecode(data);
      user = decodedata.map((e) => UserModel.fromJson(e)).toList();
      filtereduser = user;
    }
    notifyListeners();
  }

  // craete data

  Future<void> createData() async {
    final localstore = await SharedPreferences.getInstance();
    final data = user.map((e) => e.toJson()).toList();
    await localstore.setString('userdata', jsonEncode(data));
  }

  // add user function

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
// search function

  Future<void> filterUserSearch(String data) async {
    filtereduser = user.where((element) {
      return element.name.toLowerCase().contains(data.toLowerCase()) ||
             element.age.contains(data) ||
             element.phonenumber!.contains(data);
    }).toList();

    notifyListeners();
  }

// sort by name function

  void sortByName(bool ascending) {
    user.sort((a, b) {
      final nameA = a.name.toLowerCase();
      final nameB = b.name.toLowerCase();

      return ascending
          ? nameB.compareTo(nameA) 
          : nameA.compareTo(nameB); 
    });

    notifyListeners();
  }

  //image picker

  void pickimagefun(ImageSource source) async {
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