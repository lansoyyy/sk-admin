import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sk_admin/widgets/text_widget.dart';

class HelpDeskTab extends StatelessWidget {
  const HelpDeskTab({super.key});

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
              text: 'HELPDESK',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Helpdesk')
                    .where('solved', isEqualTo: false)
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
                  return Center(
                    child: SingleChildScrollView(
                      child: DataTable(columns: [
                        DataColumn(
                          label: TextWidget(
                            text: 'Date',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Name',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Description of Concern',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Actions',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                      ], rows: [
                        for (int i = 0; i < data.docs.length; i++)
                          DataRow(cells: [
                            DataCell(
                              TextWidget(
                                text: DateFormat.yMMMd()
                                    .add_jm()
                                    .format(data.docs[i]['dateTime'].toDate()),
                                fontSize: 18,
                                fontFamily: 'Regular',
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: data.docs[i]['name'],
                                fontSize: 18,
                                fontFamily: 'Regular',
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: data.docs[i]['description'],
                                fontSize: 18,
                                fontFamily: 'Regular',
                              ),
                            ),
                            DataCell(SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  TextWidget(
                                    text: data.docs[i]['solved']
                                        ? 'SETTLED'
                                        : 'UNSETTLED',
                                    fontSize: 18,
                                    fontFamily: 'Regular',
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('Helpdesk')
                                            .doc(data.docs[i].id)
                                            .update({'solved': true});
                                      },
                                      icon: const Icon(
                                          Icons.check_box_outline_blank)),
                                ],
                              ),
                            )),
                          ])
                      ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
