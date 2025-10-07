import 'package:flutter/material.dart';
import 'package:default_utility/helper/nav.dart';

import 'button.widget.dart'; // keep your NavigationService here

// -------------------- ENUM --------------------
enum ToastType {
  fade,
  slideFromTop,
  slideFromBottom,
  scale,
  bounce,
  elastic,
}



class AnimatedSnackbar extends StatefulWidget {
  final String message;
  final ToastType type;
  final ToastPosition position;
  final IconData? icon;
  final Color? color;
  final Duration duration;
  final Offset? customOffset;
  final VoidCallback onClose;
  final Widget? child;

  const AnimatedSnackbar({
    required this.message,
    required this.onClose,
    this.type = ToastType.elastic,
    this.position = ToastPosition.top,
    this.icon,
    this.color,
    this.duration = const Duration(milliseconds: 3000),
    this.customOffset,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSnackbar> createState() => AnimatedSnackbarState();
}

class AnimatedSnackbarState extends State<AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut, reverseCurve: Curves.easeIn),
    );

    // Choose slide direction
    final Offset beginOffset = _getBeginOffset(widget.type);

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: _getShowCurve(widget.type), reverseCurve: Curves.easeIn),
    );

    _scaleAnimation = _getScaleAnimation(widget.type);

    _controller.forward();

    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      await _controller.reverse();
      if (mounted) widget.onClose();
    });
  }

  Offset _getBeginOffset(ToastType type) {
    switch (type) {
      case ToastType.slideFromBottom:
        return const Offset(0, 1);
      case ToastType.slideFromTop:
      case ToastType.elastic:
      case ToastType.bounce:
      default:
        return const Offset(0, -1);
    }
  }

  Curve _getShowCurve(ToastType type) {
    switch (type) {
      case ToastType.fade:
        return Curves.easeInOut;
      case ToastType.bounce:
        return Curves.bounceOut;
      case ToastType.elastic:
        return Curves.elasticOut;
      case ToastType.scale:
        return Curves.easeOutBack;
      default:
        return Curves.easeOut;
    }
  }

  Animation<double> _getScaleAnimation(ToastType type) {
    switch (type) {
      case ToastType.bounce:
        return Tween<double>(begin: 0.6, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
        );
      case ToastType.elastic:
        return Tween<double>(begin: 0.7, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
        );
      case ToastType.scale:
        return Tween<double>(begin: 0.8, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );
      default:
        return const AlwaysStoppedAnimation(1.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Build snackbar content
  Widget _buildContent() {
    if(widget.child != null) {
      return Material(child: widget.child,);
    }
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(8),
      color: widget.color ?? Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) Icon(widget.icon, color: Colors.white),
            if (widget.icon != null) const SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Position based on [ToastPosition]
  Widget _buildPositioned(Widget child) {
    if(widget.customOffset != null) {
      final offset = widget.customOffset ?? const Offset(0, 0);
      return Positioned(
        top: offset.dy,
        left: offset.dx,
        child: child,
      );
    }

    const double margin = 20;
    switch (widget.position) {
      case ToastPosition.top:
        return Positioned(top: 50, left: margin, right: margin, child: child);
      case ToastPosition.bottom:
        return Positioned(bottom: 50, left: margin, right: margin, child: child);
      case ToastPosition.topLeft:
        return Positioned(top: 50, left: margin, child: child);
      case ToastPosition.topRight:
        return Positioned(top: 50, right: margin, child: child);
      case ToastPosition.bottomLeft:
        return Positioned(bottom: 50, left: margin, child: child);
      case ToastPosition.bottomRight:
        return Positioned(bottom: 50, right: margin, child: child);
      case ToastPosition.center:
        return Center(child: child);
      case ToastPosition.custom:
        final offset = widget.customOffset ?? const Offset(0, 0);
        return Positioned(
          top: offset.dy,
          left: offset.dx,
          child: child,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final animatedContent = SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: IgnorePointer(ignoring: true, child: _buildContent()),
        ),
      ),
    );

    return _buildPositioned(animatedContent);
  }
}


enum ToastPosition {
  top,
  bottom,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
  custom, // allows you to give offset manually
}
