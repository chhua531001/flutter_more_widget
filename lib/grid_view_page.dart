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
            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     //以下是方法1-放在背景:
            //     // image: const DecorationImage(
            //     //   image: NetworkImage(
            //     //     "https://via.placeholder.com/215x200",
            //     //   ),
            //     //   fit: BoxFit.cover,
            //     // ),
            //   ),
            //   //以下是方法2-直接放入圖片到Container中:
            //   //圖片若是放入有BorderRadius的Container時，沒有作任何Padding時，
            //   //需要加入clipBehavior: Clip.hardEdge，才會配合
            //   // clipBehavior: Clip.hardEdge,
            //   // child: Image.network(
            //   //   "https://via.placeholder.com/200x215",
            //   //   fit: BoxFit.cover,
            //   // ),
            // ),
            //以下是方法3-直接放入圖片:使用ClipRRect來作圖片的BorderRadius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://via.placeholder.com/200x215",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
