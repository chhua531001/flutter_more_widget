import 'package:flutter/material.dart';

class SimpleDialogPage extends StatelessWidget {
  const SimpleDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Simple Dialog Button Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text(
                  "My Simple Dialog",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                backgroundColor: Colors.amber.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                children: [
                  const Text("Simple Dialog information display"),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SimpleDialogOption(
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              "Yes",
                            );
                          }),
                      SimpleDialogOption(
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              "No",
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ).then((onValue) => debugPrint(onValue ?? "No value returned"));
          },
          child: const Text(
            "Simple Dialog",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
