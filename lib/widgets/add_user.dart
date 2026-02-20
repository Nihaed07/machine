import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machine/view_models/provider.dart';
import 'package:provider/provider.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final formKey = GlobalKey<FormState>();
    final nameCtr = TextEditingController();
    final ageCtr = TextEditingController();
    final phoneCtr = TextEditingController();

    bool userdetailsvalid() {
      if (formKey.currentState!.validate()) {
        provider.adduserfun(
          name: nameCtr.text.trim(),
          age: ageCtr.text.trim(),
          phonenumber: phoneCtr.text.trim(),
        );
        return true;
      }
      return false;
    }

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: StatefulBuilder(
        builder: (context, stateDialog) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Add A New User',
              style: TextStyle(
                fontFamily: 'font3',
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            content: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Stack(
                      alignment: AlignmentGeometry.bottomRight,
                      clipBehavior: Clip.none,
                      children: [
                        Consumer<UserProvider>(
                          builder: (context, provider, _) {
                            return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setStateSheet) {
                                        return Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Select Option",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'font3',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      setStateSheet(() {
                                                        provider.image_pic(
                                                          ImageSource.camera,
                                                        );
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 80,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  InkWell(
                                                    onTap: () {
                                                      setStateSheet(() {
                                                        provider.image_pic(
                                                          ImageSource.gallery,
                                                        );
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.photo,
                                                      size: 80,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: provider.imageBytes != null
                                    ? MemoryImage(provider.imageBytes!)
                                    : AssetImage(
                                        'assets/images/download (15).jpg',
                                      ),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontFamily: 'font3',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                    controller: nameCtr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),
                          width: 1,
                        ),

                        borderRadius: BorderRadius.circular(8),
                      ),
                      hint: Row(
                        children: [
                          Text(
                            'Enter Your Name',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'font3',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Age',
                      style: TextStyle(
                        fontFamily: 'font3',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your age';
                      }
                      return null;
                    },
                    controller: ageCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),
                          width: 1,
                        ),

                        borderRadius: BorderRadius.circular(8),
                      ),
                      hint: Row(
                        children: [
                          Text(
                            'Enter Your Age',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'font3',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Phone number',
                      style: TextStyle(
                        fontFamily: 'font3',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the phone';
                      }
                      if (value.length < 10) {
                        return 'enter phone number must 10 digit';
                      }
                      if (value.length > 10) {
                        return 'enter phone number 10 digit';
                      }
                      return null;
                    },
                    controller: phoneCtr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),

                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(169, 101, 101, 132),
                          width: 1,
                        ),

                        borderRadius: BorderRadius.circular(8),
                      ),
                      hint: Row(
                        children: [
                          Text(
                            'Enter Your phone number',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'font3',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 95,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xFFCCCCCC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'font3',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      final isValid = userdetailsvalid();

                      if (!isValid) return;
                      nameCtr.clear();
                      ageCtr.clear();
                      phoneCtr.clear();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 95,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xFF1782FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'font3',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),  
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
