import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sk_admin/widgets/button_widget.dart';
import 'package:sk_admin/widgets/text_widget.dart';
import 'package:sk_admin/widgets/textfield_widget.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  final searchController = TextEditingController();
  String nameSearched = '';

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final purokController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: 'USER OVERVIEW',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        nameSearched = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search user',
                        hintStyle: TextStyle(fontFamily: 'QRegular'),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                    controller: searchController,
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                ButtonWidget(
                  width: 250,
                  label: 'ADD USER',
                  onPressed: () {
                    addUser(false);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .where('isActive', isEqualTo: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;
                  return Container(
                    color: Colors.grey[200],
                    width: 800,
                    height: 400,
                    child: DataTable(columns: [
                      DataColumn(
                        label: TextWidget(
                          text: 'Name',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Address',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Proof of\nResidency',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Action',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                      ),
                    ], rows: [
                      for (int i = 0; i < data.docs.length; i++)
                        DataRow(cells: [
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['name'],
                              fontSize: 14,
                              fontFamily: 'Regular',
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['address'],
                              fontSize: 14,
                              fontFamily: 'Regular',
                            ),
                          ),
                          DataCell(
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                          DataCell(
                            ButtonWidget(
                              width: 100,
                              label: 'DELETE',
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text(
                                            'Delete Confirmation',
                                            style: TextStyle(
                                                fontFamily: 'QBold',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text(
                                            'Are you sure you want to delete this user?',
                                            style: TextStyle(
                                                fontFamily: 'QRegular'),
                                          ),
                                          actions: <Widget>[
                                            MaterialButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(true),
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(
                                                    fontFamily: 'QRegular',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .collection('Users')
                                                    .doc(data.docs[i].id)
                                                    .delete();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                    fontFamily: 'QRegular',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ));
                              },
                            ),
                          ),
                        ])
                    ]),
                  );
                }),
          ],
        ),
      ),
    );
  }

  addUser(bool inEdit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: inEdit ? 'Editing user' : 'Adding user',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldWidget(
                controller: nameController,
                label: 'Name',
              ),
              TextFieldWidget(
                controller: ageController,
                label: 'Age',
              ),
              TextFieldWidget(
                controller: addressController,
                label: 'Address',
              ),
              TextFieldWidget(
                controller: purokController,
                label: 'Purok',
              ),
              TextFieldWidget(
                controller: emailController,
                label: 'Email',
              ),
              TextFieldWidget(
                showEye: true,
                isObscure: true,
                controller: passwordController,
                label: 'Password',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: inEdit ? 'EDIT' : 'ADD',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ),
          ],
        );
      },
    );
  }
}
