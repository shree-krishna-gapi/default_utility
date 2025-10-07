import 'package:flutter/material.dart';
import '../helper/button.widget.dart';
import '../helper/nav.dart';

Future<T?> stfDialog<T>(BuildContext context0, Widget child, {double height = 300}) {
  BuildContext context = NavigationService.defaultKey.currentState!.overlay!.context;
  return showDialog<T>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Material(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: height,
              width: MediaQuery.of(context).size.width,
              child: child,
            );
          },
        ),
      );
    },
  );
}



Widget dialogButtonYes({title = 'yes'}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6)
        ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Text(title,style: TextStyle(color: AppColor.newColor.withValues(alpha: 0.9),
            fontSize: 15,letterSpacing: 0.4,fontWeight: FontWeight.w600),)),
  );
}

extension EmptySpace on num {
  SizedBox get h => SizedBox(
    height: toDouble(),
  );
  SizedBox get w => SizedBox(
    width: toDouble(),
  );
}
