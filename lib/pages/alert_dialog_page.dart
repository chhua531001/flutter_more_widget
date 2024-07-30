import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Alert Dialog Button Demo"),
      ),
      body: Center(
        //PopScope Widget只要存在body之中，作Back Button的動作時，都會被呼叫
        child: PopScope(
          canPop: false,
          onPopInvoked: (bool dipPop) async {
            if(dipPop) {
              return;
            }
            //程式若是按Back Button會執行這裏
            final bool shouldPop = await _showBackDialog() ?? false;
            debugPrint("Press Back Button");
            if(context.mounted && shouldPop) {
              debugPrint("Press OK Button");
              Navigator.pop(context);
            }
            else {
              debugPrint("Press Cancel Button");
            }
          },
          child: ElevatedButton(
            //程式若是按Warning! Button會執行這裏
            onPressed: () async {
              final bool shouldPop = await _showBackDialog() ?? false;
              if(context.mounted && shouldPop) {
                debugPrint("Press OK Button");
                Navigator.pop(context);
              }
              else {
                debugPrint("Press Cancel Button");
              }
            },
            child: const Text(
              "Warning!",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  

  //在此處因為使用StatefulWidget的關係，所以不用傳遞參數context
  //若是使用StatelessWidget就需要傳遞參數context
  Future<bool?> _showBackDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Warning !",
        ),
        content: const Text("This is a warning message!\n是否要離開回到前一頁面？"),
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
        ),
        backgroundColor: Colors.amber.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

