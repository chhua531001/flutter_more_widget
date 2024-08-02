import 'package:flutter/material.dart';

class ContactFormField extends StatelessWidget {
  const ContactFormField({super.key, required this.name, required this.maxLines, required this.hintText, required this.controller});
  final String name;
  final int maxLines;
  final String hintText;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF4756DF),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4756DF),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
