import 'package:flutter/material.dart';

import '../widgets/contact_form_field.dart';
import '../widgets/responsive.dart';

// ignore: must_be_immutable
class ResponsiveContactForm extends StatelessWidget {
  ResponsiveContactForm({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TextEditingController nameController = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    // TextEditingController phoneController = TextEditingController();
    // TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Contact Form"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            //在此加上clipBehavior: Clip.none，當height不足時，會使用到SingleChildScrollView時，邊線兩邊才不會消失
            //是因為以下SizedBox有使用BoxShadow，會有寬度被截掉問題
            clipBehavior: Clip.none,
            child: Column(
              children: [
                const Text(
                  'Get In Touch With Us',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Responsiv.isMobile(context)
                      // if the device is mobile then it takes the 90% of its total width of screen
                      ? Responsiv.widthOfScreen(context) * 0.9
                      // otherwise it takes the 80% of the total width of screen
                      : Responsiv.widthOfScreen(context) * 0.8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFC4ACA1),
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContactFormField(
                            name: "Name*",
                            maxLines: 1,
                            hintText: "Your Name",
                            controller: nameController,
                          ),
                          ContactFormField(
                            name: 'Email*',
                            maxLines: 1,
                            hintText: 'Your Email',
                            controller: emailController,
                          ),
                          ContactFormField(
                            name: 'Phone Number',
                            maxLines: 1,
                            hintText: 'Your phone number',
                            controller: phoneController,
                          ),
                          ContactFormField(
                            controller: messageController,
                            name: 'Message*',
                            maxLines: 10,
                            hintText: 'Your Message',
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  onPressed: () {
                                    debugPrint("Name -> ${nameController.text}");
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
