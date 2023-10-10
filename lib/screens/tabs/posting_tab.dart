import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sk_admin/widgets/button_widget.dart';
import 'package:sk_admin/widgets/text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/textfield_widget.dart';

class PostingTab extends StatefulWidget {
  const PostingTab({super.key});

  @override
  State<PostingTab> createState() => _PostingTabState();
}

class _PostingTabState extends State<PostingTab> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'POSTING',
                fontSize: 32,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Bold',
                ),
                tabs: [
                  Tab(
                    text: 'Activity',
                  ),
                  Tab(
                    text: 'Announcement',
                  ),
                  Tab(
                    text: 'Survey',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(children: [
                  activity(),
                  announcements(),
                  survey(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: primary,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }

  Widget activity() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            // uploadImage('gallery');
          },
          child: Container(
            height: 150,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.black,
              // image: idFileName == ''
              //     ? null
              //     : DecorationImage(
              //         image: NetworkImage(
              //           idImageURL,
              //         ),
              //         fit: BoxFit.cover),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(label: 'Name of Activity', controller: nameController),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
            label: 'Description of Activity', controller: descController),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                dateFromPicker(context);
              },
              child: SizedBox(
                width: 325,
                height: 50,
                child: TextFormField(
                  enabled: false,
                  style: const TextStyle(
                    fontFamily: 'Regular',
                    fontSize: 14,
                    color: primary,
                  ),

                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.calendar_month_outlined,
                      color: primary,
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'Regular',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    hintText: dateController.text,
                    border: InputBorder.none,
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorStyle:
                        const TextStyle(fontFamily: 'Bold', fontSize: 12),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  controller: dateController,
                  // Pass the validator to the TextFormField
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          color: primary,
          label: 'POST NOW',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget announcements() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
            label: 'Name of Announcement', controller: nameController),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
            label: 'Description of Announcement', controller: descController),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          color: primary,
          label: 'POST NOW',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget survey() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final linkController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(label: 'Name of Survey', controller: nameController),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
            label: 'Description of Survey', controller: descController),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(label: 'Google Form Link', controller: linkController),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          color: primary,
          label: 'POST NOW',
          onPressed: () {},
        ),
      ],
    );
  }
}
