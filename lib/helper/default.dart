import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:default_utility/helper/nav.dart';
import 'package:default_utility/helper/snack.dart';

import 'button.widget.dart';

class Default {
  static bool _isShowing = false;
  static Future<void> toast(
      String message, {
        ToastPosition position = ToastPosition.bottom,
        ToastType type = ToastType.scale,
        Duration duration = const Duration(milliseconds: 2500),
        Duration? delay,
        IconData? icon,
        Color? color,
        bool lastToastShownAt = false,
        Offset? customOffset,
        Widget? child

      }) async {
    if(delay != null) {
      await Future.delayed(delay);
    }

    if(lastToastShownAt) {
      if (_isShowing) return;
    }
    _isShowing = true;

    final overlay = NavigationService.defaultKey.currentState?.overlay;
    if (overlay == null) {
      _isShowing = false;
      return;
    }

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (_) => AnimatedSnackbar(
        message: message,
        position: position,
        type: type,
        icon: icon,
        color: color,
        duration: duration,
        customOffset: customOffset,
        child: child,
        onClose: () {
          // remove safely
          if (overlayEntry.mounted) overlayEntry.remove();
          _isShowing = false;
        },
      ),
    );

    overlay.insert(overlayEntry);
  }

  static Future<void> dialog({double? height,String confirmationTitle = "Confirmation!",
    String confirmationTitleSubTitle = "Are you sure",Function? onOk,Function? onCancel,String buttonTitleConfirm = "OK",String buttonTitleCancel = "Cancel"}) {
    BuildContext context = NavigationService.defaultKey.currentState!.overlay!.context;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(confirmationTitle),
          content: Text(confirmationTitleSubTitle),
          actions: <Widget>[
            GestureDetector(
              child:  dialogButtonYes(title:buttonTitleConfirm),
              onTap: ()=>onOk!(),
            ),
            GestureDetector(
              child:  dialogButtonNo(title:buttonTitleCancel),
              onTap: () {
                if(onCancel == null) {
                  Navigator.of(context).pop();
                } else {
                  onCancel();
                }

              },
            )
          ],
        );
      },
    );
  }
}