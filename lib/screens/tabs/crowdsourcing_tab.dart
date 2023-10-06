import 'package:flutter/material.dart';
import 'package:sk_admin/widgets/text_widget.dart';

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
            Container(
              color: Colors.grey,
              width: 900,
              height: 550,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/profile.png',
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Name of the user',
                                        fontSize: 18,
                                        fontFamily: 'Bold',
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text: 'Youth Participant',
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ],
                              ),
                              TextWidget(
                                text: 'QUESTION EVENT',
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: 'Description here',
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Colors.grey,
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
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
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DropdownButton<String>(
                                      underline: const SizedBox(),
                                      value: choice,
                                      items: choices.map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Center(
                                            child: SizedBox(
                                              width: 150,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'QRegular',
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
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
                                        borderRadius: BorderRadius.circular(5)),
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
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'QRegular',
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
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
