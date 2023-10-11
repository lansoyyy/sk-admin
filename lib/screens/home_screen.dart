import 'package:flutter/material.dart';
import 'package:sk_admin/screens/tabs/crowdsourcing_tab.dart';
import 'package:sk_admin/screens/tabs/dashboard_tab.dart';
import 'package:sk_admin/screens/tabs/helpdesk_tab.dart';
import 'package:sk_admin/screens/tabs/overview_tab.dart';
import 'package:sk_admin/screens/tabs/posting_tab.dart';
import 'package:sk_admin/screens/tabs/registration_tab.dart';
import 'package:sk_admin/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dash = true;
  bool reg = false;
  bool over = false;
  bool crowd = false;
  bool posting = false;
  bool helpdesk = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.grey[300],
            height: double.infinity,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 125,
                  width: 125,
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = true;
                      reg = false;
                      crowd = false;
                      over = false;
                      posting = false;
                      helpdesk = false;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'Dashboard',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: dash ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.dashboard,
                    color: dash ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = false;
                      reg = true;
                      over = false;
                      crowd = false;
                      posting = false;
                      helpdesk = false;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'USER REGISTRATION',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: reg ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.person,
                    color: reg ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = false;
                      reg = false;
                      over = true;
                      crowd = false;
                      posting = false;
                      helpdesk = false;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'USER OVERVIEW',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: over ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.account_circle,
                    color: over ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = false;
                      reg = false;
                      over = false;
                      crowd = true;
                      posting = false;
                      helpdesk = false;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'CROWDSOURCING',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: crowd ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.supervised_user_circle,
                    color: crowd ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = false;
                      reg = false;
                      over = false;
                      crowd = false;
                      posting = true;
                      helpdesk = false;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'POSTING',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: posting ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.post_add,
                    color: posting ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      dash = false;
                      reg = false;
                      over = false;
                      crowd = false;
                      posting = false;
                      helpdesk = true;
                    });
                  },
                  tileColor: Colors.green,
                  title: TextWidget(
                    text: 'HELPDESK',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: helpdesk ? Colors.green : Colors.white,
                  ),
                  leading: Icon(
                    Icons.help,
                    color: helpdesk ? Colors.green : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: dash
                ? const DashboardTab()
                : reg
                    ? const RegistrationTab()
                    : over
                        ? const OverviewTab()
                        : posting
                            ? const PostingTab()
                            : helpdesk
                                ? const HelpDeskTab()
                                : const CrowdsourcingTab(),
          ),
        ],
      ),
    );
  }
}
