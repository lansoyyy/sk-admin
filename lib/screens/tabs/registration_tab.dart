import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sk_admin/widgets/text_widget.dart';

class RegistrationTab extends StatelessWidget {
  const RegistrationTab({super.key});

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
              text: 'PENDING USERS',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .where('isActive', isEqualTo: false)
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Image.network(
                                          data.docs[i]['residency']),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: TextWidget(
                                            text: 'Close',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(data.docs[i].id)
                                          .update({'isActive': true});
                                    },
                                    icon: const Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(data.docs[i].id)
                                          .update({'isActive': false});
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
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
}
