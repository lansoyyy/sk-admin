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
            Container(
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
                    text: 'Age',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: 'Sex',
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
                for (int i = 0; i < 5; i++)
                  DataRow(cells: [
                    DataCell(
                      TextWidget(
                        text: 'Name',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'Age',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'Sex',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'Address',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'Proof of\nResidency',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'Action',
                        fontSize: 14,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
