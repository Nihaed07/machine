import 'package:flutter/material.dart';
import 'package:machine/view_models/provider.dart';
import 'package:machine/widgets/add_user.dart';
import 'package:provider/provider.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.white),
        title: Text(
          "Nilambur",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEBEBEB),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => const AddUser());
        },
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "search by name",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 250,
                          child: Center(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                      left: 20,
                                    ),
                                    child: Text(
                                      "Sort ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'font3',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                RadioListTile(
                                  value: "All",
                                  title: Text(
                                    "All",
                                    style: TextStyle(
                                      fontFamily: 'font3',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                RadioListTile(
                                  value: "Age:Elder",
                                  title: Text(
                                    "Age:Elder",
                                    style: TextStyle(
                                      fontFamily: 'font3',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                RadioListTile(
                                  value: "Age:Younger",
                                  title: Text(
                                    "Age:Younger",
                                    style: TextStyle(
                                      fontFamily: 'font3',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Users Lists",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'font3',
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/download (15).jpg',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'font3',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Age: ....",
                              style: TextStyle(
                                fontFamily: 'font3',
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
