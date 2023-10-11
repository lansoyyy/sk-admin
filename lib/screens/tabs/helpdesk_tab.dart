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
                      subtitle: TextWidget(
                        text: '1',
                        fontSize: 32,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
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
                      subtitle: TextWidget(
                        text: '1',
                        fontSize: 32,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
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
                      subtitle: TextWidget(
                        text: '1',
                        fontSize: 32,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
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
                      subtitle: TextWidget(
                        text: '1',
                        fontSize: 32,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
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
            Container(
              color: Colors.grey,
              width: 650,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
