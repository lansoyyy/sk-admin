import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sk_admin/widgets/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  void initState() {
    super.initState();
    getDataMonth();
  }

  bool hasLoaded = false;

  List users = [];

  getDataMonth() async {
    for (int i = 0; i < 10; i++) {
      var collection = FirebaseFirestore.instance
          .collection('Users')
          .where('purok', isEqualTo: 'Purok $i');

      var querySnapshot = await collection.get();

      // datasMonth.add(querySnapshot.size);

      users.add(querySnapshot.size);
    }

    setState(() {
      hasLoaded = true;
    });
  }

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
              text: 'DASHBOARD',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 500,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/4.png',
                        height: 50,
                        width: 50,
                      ),
                      title: TextWidget(
                        text: 'Pending Registration',
                        fontSize: 18,
                        fontFamily: 'Medium',
                        color: Colors.black,
                      ),
                      subtitle: StreamBuilder<QuerySnapshot>(
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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return TextWidget(
                              text: data.docs.length.toString(),
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            );
                          }),
                    )),
                SizedBox(
                    width: 500,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/2.png',
                        height: 50,
                        width: 50,
                      ),
                      title: TextWidget(
                        text: 'Crowdsource Idea',
                        fontSize: 18,
                        fontFamily: 'Medium',
                        color: Colors.black,
                      ),
                      subtitle: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Crowdsourcing')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return TextWidget(
                              text: data.docs.length.toString(),
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            );
                          }),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 500,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/4.png',
                        height: 50,
                        width: 50,
                      ),
                      title: TextWidget(
                        text: 'Help Desk',
                        fontSize: 18,
                        fontFamily: 'Medium',
                        color: Colors.black,
                      ),
                      subtitle: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Helpdesk')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return TextWidget(
                              text: data.docs.length.toString(),
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            );
                          }),
                    )),
                SizedBox(
                    width: 500,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/3.png',
                        height: 50,
                        width: 50,
                      ),
                      title: TextWidget(
                        text: 'Total Users',
                        fontSize: 18,
                        fontFamily: 'Medium',
                        color: Colors.black,
                      ),
                      subtitle: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return TextWidget(
                              text: data.docs.length.toString(),
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            );
                          }),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Number of users',
              fontSize: 18,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            hasLoaded
                ? SizedBox(
                    width: 650,
                    height: 300,
                    child: SfCartesianChart(

                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<ChartData1, String>(
                              dataSource: [
                                // Bind data source
                                for (int i = 0; i < users.length; i++)
                                  ChartData1('Purok $i', users[i]),
                              ],
                              xValueMapper: (ChartData1 data, _) => data.x,
                              yValueMapper: (ChartData1 data, _) => data.y)
                        ]),
                  )
                : const CircularProgressIndicator()
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
