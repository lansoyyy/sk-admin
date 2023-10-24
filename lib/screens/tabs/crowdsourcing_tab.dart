import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sk_admin/widgets/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CrowdsourcingTab extends StatefulWidget {
  const CrowdsourcingTab({super.key});

  @override
  State<CrowdsourcingTab> createState() => _CrowdsourcingTabState();
}

class _CrowdsourcingTabState extends State<CrowdsourcingTab> {
  List<String> choices = [
    'Yes',
    'No',
  ];

  String choice = 'Yes';

  List<String> puroks = [
    'Purok 1',
    'Purok 2',
    'Purok 3',
    'Purok 4',
  ];

  bool hasLoaded = false;

  String purok = 'Purok 1';
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
              text: 'CROWSOURCE MONITORING',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Crowdsourcing')
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

                  if (!hasLoaded) {
                    choice = data.docs[0]['options'][0];
                  }
                  return Container(
                    color: Colors.grey,
                    width: 900,
                    height: 550,
                    child: GridView.builder(
                      itemCount: data.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/profile.png',
                                          height: 50,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: DateFormat.yMMMd()
                                                  .add_jm()
                                                  .format(data.docs[index]
                                                          ['dateTime']
                                                      .toDate()),
                                              fontSize: 18,
                                              fontFamily: 'Bold',
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        const Expanded(
                                          child: SizedBox(
                                            width: 10,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection('Crowdsourcing')
                                                .doc(data.docs[index].id)
                                                .delete();
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextWidget(
                                      text: data.docs[index]['name'],
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      text: data.docs[index]['description'],
                                      fontSize: 14,
                                      fontFamily: 'Medium',
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: DropdownButton<String>(
                                            underline: const SizedBox(),
                                            value: choice,
                                            items: [
                                              for (int i = 0;
                                                  i <
                                                      data
                                                          .docs[index]
                                                              ['options']
                                                          .length;
                                                  i++)
                                                DropdownMenuItem<String>(
                                                  value: data.docs[index]
                                                      ['options'][i],
                                                  child: Center(
                                                    child: SizedBox(
                                                      width: 150,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          data.docs[index]
                                                              ['options'][i],
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'QRegular',
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ],
                                            onChanged: (newValue) {
                                              setState(() {
                                                choice = newValue.toString();
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: DropdownButton<String>(
                                            underline: const SizedBox(),
                                            value: purok,
                                            items: puroks.map((String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 150,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'QRegular',
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                purok = newValue.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 250,
                                      child: SfCartesianChart(

                                          // Initialize category axis
                                          primaryXAxis: CategoryAxis(),
                                          series: <ChartSeries>[
                                            // Initialize line series
                                            LineSeries<ChartData1, String>(
                                                dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i <
                                                          data
                                                              .docs[index]
                                                                  ['options']
                                                              .length;
                                                      i++)
                                                    ChartData1(
                                                        data.docs[index]
                                                            ['options'][i],
                                                        data.docs[index][data
                                                                .docs[index]
                                                            ['options'][i]]),
                                                ],
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y)
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class ChartData1 {
  ChartData1(this.x, this.y);
  final String x;
  final double? y;
}
