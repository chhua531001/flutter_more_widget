import 'package:flutter/material.dart';
import 'package:flutter_more_widget/app_routes.dart';
import 'package:flutter_more_widget/custom_scroll_view_page.dart';
import 'package:flutter_more_widget/grid_view_page.dart';
import 'package:flutter_more_widget/widgets/app_layoutbuilder_widget.dart';
import 'package:flutter_more_widget/widgets/big_circle.dart';
import 'package:flutter_more_widget/widgets/big_dot.dart';
import 'package:flutter_more_widget/widgets/circle_dot.dart';
import 'package:flutter_more_widget/widgets/half_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const CustomScrollViewPage(),
      routes: {
        AppRoutes.homePage: (context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
        AppRoutes.customScrollViewPage: (context) =>
            const CustomScrollViewPage(),
        AppRoutes.gridViewPage: (context) => const GridViewPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("More Widgets"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            color: Colors.orange,
            child: const Row(
              children: [
                HalfCircle(isRight: false),
                BigCircle(),
                Expanded(
                  child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                  ),
                ),
                BigDot(),
                HalfCircle(isRight: true)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleDot(),
                CircleDot(),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //傳送參數到想顯示的頁面
              Navigator.pushNamed(
                context,
                AppRoutes.customScrollViewPage,
                arguments: {
                  "index": 1,
                },
              );
            },
            child: const Text("CustomScrollViewDemo"),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              //傳送參數到想顯示的頁面
              Navigator.pushNamed(
                context,
                AppRoutes.gridViewPage,
                arguments: {
                  "index": 2,
                },
              );
            },
            child: const Text("GridViewDemo"),
          ),
        ],
      ),
    );
  }
}
