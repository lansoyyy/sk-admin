import 'package:flutter/material.dart';
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
            Center(
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
                      text: 'Purok',
                      fontSize: 18,
                      fontFamily: 'Bold',
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Title of Concern',
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
                  for (int i = 0; i < 10; i++)
                    DataRow(cells: [
                      DataCell(
                        TextWidget(
                          text: 'Sample',
                          fontSize: 18,
                          fontFamily: 'Regular',
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Sample',
                          fontSize: 18,
                          fontFamily: 'Regular',
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Sample',
                          fontSize: 18,
                          fontFamily: 'Regular',
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Sample',
                          fontSize: 18,
                          fontFamily: 'Regular',
                        ),
                      ),
                      DataCell(SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            TextWidget(
                              text: 'UNSETTLED',
                              fontSize: 18,
                              fontFamily: 'Regular',
                            ),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.check_box_outline_blank)),
                          ],
                        ),
                      )),
                    ])
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
