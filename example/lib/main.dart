import 'package:flutter/material.dart';
import '../helper/button.widget.dart';
import '../helper/default.dart';
import '../helper/dialog.dart';
import '../helper/nav.dart';
import '../helper/snack.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    navigatorKey: NavigationService.defaultKey,
    title: 'Default Utility',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            100.h,
            ElevatedButton(
              onPressed: () {
                Default.toast("This is a fancy toast! 🎉");
              },
              child: const Text("Basic Toast"),
            ),
            ElevatedButton(
              onPressed: () {
                Default.toast(
                  "This is a fancy toast! 🎉",
                  icon: Icons.check_circle,
                  type: ToastType.slideFromTop,
                  color: Colors.green,
                  customOffset: Offset(20, 100),
                );
              },
              child: const Text("Fancy Toast"),
            ),
            15.h,
            ElevatedButton(
              onPressed: () {
                Default.toast("",
                    customOffset: Offset(30, 600),
                    child: Container(
                       decoration: BoxDecoration(
                  color: Colors.grey[100], // very light background
                    border: Border.all(
                      color: Colors.grey[800]!, // dark border
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Row(
                      children: [
                        FlutterLogo(size: 120,),
                        Text("Custom Toast 🎉",style: TextStyle(fontSize: 32),)
                      ],
                    ),
                  )
                );
              },
              child: const Text("Custom Toast"),
            ),
            50.h,
            ElevatedButton(
              onPressed: () {
                Default.dialog(confirmationTitle: "Basic Confirmation Dialog",onOk: (){
                  pageBack();
                });
              },
              child: const Text("Default Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                stfDialog(context, Column(
                  children: [
                    FlutterLogo(size: 120,),
                    Text("Custom Toast 🎉",style: TextStyle(fontSize: 32),)
                  ],
                ));
              },
              child: const Text("Show Snackbar"),
            ),
          ],
        ),
      ),
    );
  }
}
