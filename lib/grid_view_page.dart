import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    //接受傳遞的參數
    Map args = ModalRoute.of(context)?.settings.arguments as Map;
    debugPrint("args - > $args");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GridView Demo"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  //以下是方法1:
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://via.placeholder.com/215x200",
                    ),
                    fit: BoxFit.cover,
                  )
                  ),
              //以下是方法2:
              // clipBehavior: Clip.hardEdge,
              // child: Image.network(
              //   "https://via.placeholder.com/200x215",
              //   fit: BoxFit.cover,
              // ),
            ),
          );
        },
      ),
    );
  }
}
