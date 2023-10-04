import 'package:flutter/material.dart';
import 'package:sk_admin/widgets/button_widget.dart';
import 'package:sk_admin/widgets/text_widget.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  final searchController = TextEditingController();
  String nameSearched = '';
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
                  width: 100,
                  label: 'ADD',
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonWidget(
                  width: 100,
                  label: 'DELETE',
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonWidget(
                  width: 100,
                  label: 'EDIT',
                  onPressed: () {},
                ),
              ],
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
