import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machine/view_models/provider.dart';
import 'package:machine/widgets/add_user.dart';
import 'package:provider/provider.dart';

class Homeui extends StatelessWidget {
  const Homeui({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    String? sortvalueradiobutton = 'All';
    final formKey = GlobalKey<FormState>();
    final nameCtr = TextEditingController();
    final ageCtr = TextEditingController();
    final phoneCtr = TextEditingController();

    final searchFilterCtr = TextEditingController();

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

    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddUser();
              },
            );
          },
          shape: CircleBorder(),
          elevation: 0,
          backgroundColor: Color(0xFF100E09),
          child: Icon(Icons.add, color: Colors.white, size: 45),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        toolbarHeight: 70,
        backgroundColor: Color(0xFF100E09),
        title: Row(
          children: [
            Icon(Icons.location_on_sharp, color: Colors.white, size: 16),
            SizedBox(width: 5),
            Text(
              'Nilambur',
              style: TextStyle(
                fontFamily: 'font3',
                fontWeight: FontWeight.w500,
                color: Color(0xFFFAFAFA),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFEBEBEB),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchFilterCtr,
                          onChanged: (value) {
                            provider.UserSearch(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(169, 101, 101, 132),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(169, 101, 101, 132),

                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(36),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(169, 101, 101, 132),
                                width: 1,
                              ),

                              borderRadius: BorderRadius.circular(36),
                            ),
                            hint: Row(
                              children: [
                                Text(
                                  'search by name',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'font3',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
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
                                          "Sort",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'font3',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        SizedBox(height: 20),
                                        RadioListTile(
                                          value: 'All',
                                          groupValue: sortvalueradiobutton,
                                          onChanged: (value) {
                                            setStateSheet(() {
                                              sortvalueradiobutton = value;
                                            });
                                            if (value == 'All') {
                                              provider.fitered_user =
                                                  provider.user;
                                            } else if (value ==
                                                'Age: Younger') {
                                              provider.sortByAge(true);
                                            } else if (value == 'Age: Elder') {
                                              provider.sortByAge(false);
                                            }
                                          },
                                          title: Text(
                                            'All',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'font3',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),

                                        RadioListTile(
                                          value: 'Age: Elder',
                                          groupValue: sortvalueradiobutton,
                                          onChanged: (value) {
                                            setStateSheet(() {
                                              sortvalueradiobutton = value;
                                            });
                                            if (value == 'All') {
                                              provider.fitered_user =
                                                  provider.user;
                                            } else if (value ==
                                                'Age: Younger') {
                                              provider.sortByAge(true);
                                            } else if (value == 'Age: Elder') {
                                              provider.sortByAge(false);
                                            }
                                          },
                                          title: Text(
                                            'Age: Elder',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'font3',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        RadioListTile(
                                          value: 'Age: Younger',
                                          groupValue: sortvalueradiobutton,
                                          onChanged: (value) {
                                            setStateSheet(() {
                                              sortvalueradiobutton = value;
                                            });
                                            if (value == 'All') {
                                              provider.fitered_user =
                                                  provider.user;
                                            } else if (value ==
                                                'Age: Younger') {
                                              provider.sortByAge(true);
                                            } else if (value == 'Age: Elder') {
                                              provider.sortByAge(false);
                                            }
                                          },
                                          title: Text(
                                            'Age: Younger',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'font3',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF100E09),
                          ),
                          child: Icon(
                            Icons.filter_list_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Text(
                    'users Lists',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'font3',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                provider.fitered_user.isEmpty
                    ? Center(child: Text('No user found'))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),

                        itemCount: provider.fitered_user.length,

                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 8,
                              left: 16,
                              right: 16,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage:
                                        provider.fitered_user[index].image !=
                                            null
                                        ? MemoryImage(
                                            base64Decode(
                                              provider
                                                  .fitered_user[index]
                                                  .image!,
                                            ),
                                          )
                                        : const AssetImage(
                                                'assets/images/download (15).jpg',
                                              )
                                              as ImageProvider,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(provider.fitered_user[index].name),
                                      Row(
                                        children: [
                                          Text('Age:'),
                                          Text(
                                            provider.fitered_user[index].age,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Ph no: '),
                                          Text(
                                            provider
                                                .fitered_user[index]
                                                .phonenumber,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
